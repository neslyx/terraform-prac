terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region     = "eu-north-1"
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  default_tags {
    tags = {
      Project   = "trainee-project"
      ManagedBy = "Terraform"
      Env       = "prod"
    }
  }

  endpoints {
    ec2 = "http://localhost:4566"
  }
}
