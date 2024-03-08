terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }

    http = {
      source = "hashicorp/http"
    }
  }
  required_version = ">= 0.13"
}
