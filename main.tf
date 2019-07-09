locals {
  name = "${var.stack}-${var.name}"
}

data "aws_iam_policy_document" "default" {
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = [
      "iot:*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iot_policy" "default" {
  name   = "${local.name}-IoTCoreFullAccess"
  policy = data.aws_iam_policy_document.default.json
}

resource "aws_iot_thing" "default" {
  name = local.name
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

resource "aws_ssm_parameter" "certificate_pem" {
  name   = "/${local.name}/iot/certificate-pem"
  type   = "SecureString"
  value  = aws_iot_certificate.default.certificate_pem
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "public_key" {
  name   = "/${local.name}/iot/public-key"
  type   = "SecureString"
  value  = aws_iot_certificate.default.public_key
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "private_key" {
  name   = "/${local.name}/iot/private-key"
  type   = "SecureString"
  value  = aws_iot_certificate.default.private_key
  key_id = var.kms_key_id
  tags   = var.tags
}