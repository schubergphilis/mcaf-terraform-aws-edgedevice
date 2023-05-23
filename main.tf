locals {
  create_role = var.ssm_activation_role_id != null ? 0 : 1
  iot_policy  = var.iot_policy != null ? var.iot_policy : data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "iot:Publish",
      "iot:Subscribe",
      "iot:Connect",
      "iot:Receive",
      "iot:GetThingShadow",
      "iot:UpdateThingShadow",
      "iot:DeleteThingShadow"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "greengrass:AssumeRoleForGroup",
      "greengrass:CreateCertificate",
      "greengrass:GetDeployment",
      "greengrass:GetDeploymentArtifacts",
      "greengrass:UpdateCoreDeploymentStatus",
      "greengrass:GetConnectivityInfo",
      "greengrass:UpdateConnectivityInfo"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iot_policy" "default" {
  name   = "IoTCoreFullAccess-${var.name}"
  policy = local.iot_policy
}

resource "aws_iot_thing" "default" {
  name = var.name
}

resource "aws_iot_certificate" "default" {
  active = true
}

data "http" "root_ca" {
  url = "https://www.amazontrust.com/repository/AmazonRootCA1.pem"
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
  name   = "/${var.name}/iot/certificate-pem"
  type   = "SecureString"
  value  = aws_iot_certificate.default.certificate_pem
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "public_key" {
  name   = "/${var.name}/iot/public-key"
  type   = "SecureString"
  value  = aws_iot_certificate.default.public_key
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "private_key" {
  name   = "/${var.name}/iot/private-key"
  type   = "SecureString"
  value  = aws_iot_certificate.default.private_key
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "root_ca_crt" {
  name   = "/${var.name}/iot/root-ca-crt"
  type   = "SecureString"
  value  = data.http.root_ca.response_body
  key_id = var.kms_key_id
  tags   = var.tags
}
