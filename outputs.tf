output name {
  value       = aws_iot_thing.default.name
  description = "Name of the thing"
}

output arn {
  value       = aws_iot_thing.default.arn
  description = "ARN of the thing"
}

output certificate_id {
  value       = aws_iot_certificate.default.id
  description = "Id of the certificate"
}

output certificate_arn {
  value       = aws_iot_certificate.default.arn
  description = "ARN of the certificate"
}

output certificate_pem {
  value       = aws_ssm_parameter.certificate_pem.name
  description = "Path of the SSM Parameter for IoT certificate pem"
}

output certificate_public_key {
  value       = aws_ssm_parameter.public_key.name
  description = "Path of the SSM Parameter for IoT certificate public key"
}

output certificate_private_key {
  value       = aws_ssm_parameter.private_key.name
  description = "Path of the SSM Parameter for IoT certificate private key"
}
