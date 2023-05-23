variable "name" {
  type        = string
  description = "The name of the edge device"
}

variable "expiration_duration" {
  type        = string
  default     = "672h"
  description = "The expiration period of the SSM activation, default 4 weeks"
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID used to encrypt all data"
}

variable "iot_policy" {
  type        = string
  default     = null
  description = "The policy to attach to the Thing"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the SSM Parameter"
}
