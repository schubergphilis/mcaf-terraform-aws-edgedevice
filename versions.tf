terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    http = {
      source  = "hashicorp/http"
      version = ">= 2.2.0"
    }
  }
  required_version = ">= 0.13"
}
