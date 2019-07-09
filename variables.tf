variable "name" {
  type        = string
  description = "The name of the edge device"
}

variable "kms_key_id" {
  type        = string
  description = "The AWS KMS key ID to use for the encryption"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the SSM Parameter"
}
