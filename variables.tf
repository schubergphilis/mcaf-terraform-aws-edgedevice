variable "name" {
  type        = string
  description = "The name of the edge device"
}

variable "expiration_duration" {
  type        = string
  default     = "24h"
  description = "The expiration period of the SSM activation"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the SSM Parameter"
}
