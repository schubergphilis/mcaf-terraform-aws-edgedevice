variable "name" {
  type        = string
  description = "The name of the edge device"
}

variable "patch_group" {
  type        = string
  default     = null
  description = "Group used by SSM to assign a patch baseline to a device"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the SSM Parameter"
}
