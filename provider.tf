terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # or newer
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
