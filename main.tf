data aws_iam_policy_document default {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "iot:*"
    ]
    resources = [
      "*"
    ]
  }
}

resource aws_iot_policy default {
  name   = "IoTCoreFullAccess-${var.name}"
  policy = data.aws_iam_policy_document.default.json
}

resource aws_iot_thing default {
  name = var.name
}

resource aws_iot_certificate default {
  active = true
}

resource aws_iot_policy_attachment default {
  policy = aws_iot_policy.default.name
  target = aws_iot_certificate.default.arn
}

resource aws_iot_thing_principal_attachment default {
  principal = aws_iot_certificate.default.arn
  thing     = aws_iot_thing.default.name
}

module edgedevice_kms_key {
  source      = "github.com/schubergphilis/terraform-aws-mcaf-kms?ref=v0.1.3"
  name        = var.name
  description = "KMS key used for encrypting SSM Parameters for edge devices"
  tags        = var.tags
}

resource aws_ssm_parameter certificate_pem {
  name   = "/${var.name}/iot/certificate-pem"
  type   = "SecureString"
  value  = aws_iot_certificate.default.certificate_pem
  key_id = module.edgedevice_kms_key.id
  tags   = var.tags
}

resource aws_ssm_parameter public_key {
  name   = "/${var.name}/iot/public-key"
  type   = "SecureString"
  value  = aws_iot_certificate.default.public_key
  key_id = module.edgedevice_kms_key.id
  tags   = var.tags
}

resource aws_ssm_parameter private_key {
  name   = "/${var.name}/iot/private-key"
  type   = "SecureString"
  value  = aws_iot_certificate.default.private_key
  key_id = module.edgedevice_kms_key.id
  tags   = var.tags
}

data aws_iam_policy_document ssm_activation {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["ssm.amazonaws.com"]
    }
  }
}

resource aws_iam_role ssm_activation {
  name               = "SSMActivation-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.ssm_activation.json
}

resource aws_iam_role_policy_attachment ssm_activation {
  role       = "${aws_iam_role.ssm_activation.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource aws_ssm_activation default {
  name               = var.name
  description        = "SSM Activation for ${var.name}"
  iam_role           = "${aws_iam_role.ssm_activation.id}"
  registration_limit = 1
  depends_on         = ["aws_iam_role_policy_attachment.ssm_activation"]
}


resource aws_ssm_parameter ssm_activation {
  name   = "/${var.name}/iot/ssm-activation"
  type   = "SecureString"
  value  = aws_ssm_activation.default.activation_code
  key_id = module.edgedevice_kms_key.id
  tags   = var.tags
}
