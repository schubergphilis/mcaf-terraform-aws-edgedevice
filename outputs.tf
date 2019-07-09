output "aws_iot_certificate_id" {
  value       = aws_iot_certificate.default.id
  description = "Id of the certificate"
}

output "aws_iot_certificate_arn" {
  value       = aws_iot_certificate.default.arn
  description = "ARN of the certificate"
}
output "aws_iot_policy_name" {
  value       = aws_iot_policy.default.name
  description = "Name of the policy"
}

output "aws_iot_policy_arn" {
  value       = aws_iot_policy.default.arn
  description = "ARN of the policy"
}

output "aws_iot_thing_name" {
  value       = aws_iot_thing.default.name
  description = "Name of the thing"
}

output "aws_iot_thing_arn" {
  value       = aws_iot_thing.default.arn
  description = "ARN of the thing"
}