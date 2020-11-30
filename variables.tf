variable "name" {
  type        = string
  description = "The name of the edge device"
}

variable "expiration_duration" {
  type        = string
  default     = "672h"
  description = "The expiration period of the SSM activation, default 4 weeks"
}

variable "iot_policy" {
  type        = string
  default     = null
  description = "The policy to attach to the Thing"
}

variable "ssm_activation_role_id" {
  type        = string
  default     = null
  description = "The ID of the role to attach to the SSM activation"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the SSM Parameter"
}
