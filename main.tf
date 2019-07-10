data "aws_iam_policy_document" "default" {
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

resource "aws_iot_policy" "default" {
  name   = "IoTCoreFullAccess-${var.name}"
  policy = data.aws_iam_policy_document.default.json
}

resource "aws_iot_thing" "default" {
  name = var.name
}

resource "aws_iot_certificate" "default" {
  active = true
}

resource "aws_iot_policy_attachment" "default" {
  policy = aws_iot_policy.default.name
  target = aws_iot_certificate.default.arn
}

resource "aws_iot_thing_principal_attachment" "default" {
  principal = aws_iot_certificate.default.arn
  thing     = aws_iot_thing.default.name
}

module "edgedevice_kms_key" {
  source      = "github.com/schubergphilis/mcaf-terraform-aws-kms?ref=v0.1.3"
  name        = var.name
  description = "KMS key used for encrypting SSM Parameters for edge devices"
  tags        = var.tags
}

resource "aws_ssm_parameter" "certificate_pem" {
  name   = "/${var.name}/iot/certificate-pem"
  type   = "SecureString"
  value  = aws_iot_certificate.default.certificate_pem
  key_id = module.edgedevice_kms_key.id
  tags   = var.tags
}

resource "aws_ssm_parameter" "public_key" {
  name   = "/${var.name}/iot/public-key"
  type   = "SecureString"
  value  = aws_iot_certificate.default.public_key
  key_id = module.edgedevice_kms_key.id
  tags   = var.tags
}

resource "aws_ssm_parameter" "private_key" {
  name   = "/${var.name}/iot/private-key"
  type   = "SecureString"
  value  = aws_iot_certificate.default.private_key
  key_id = module.edgedevice_kms_key.id
  tags   = var.tags
}
