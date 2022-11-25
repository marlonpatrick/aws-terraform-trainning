terraform {
  cloud {
    organization = "mpwtech-terracloud"
    workspaces {
      name = "aws-terraform-trainning"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

