variable "name" {
  type        = string
  description = "The name of the edge device"
}

variable "expiration_duration" {
  type        = string
  default     = "672h"
  description = "The expiration period of the SSM activation, default 4 weeks"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the SSM Parameter"
}
