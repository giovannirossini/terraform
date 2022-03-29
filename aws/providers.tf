terraform {
  required_providers {
    aws       = {
      source  = "hashicorp/aws"
      version = "~> 4.6.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-example"
    key    = "example/terraform.tfstate"
    region = "REGION"
    access_key  = "ACCESS_KEY"
    secret_key  = "SECRET_KEY"
  }
}

provider "aws" {
  region      = "REGION"
  access_key  = "ACCESS_KEY"
  secret_key  = "SECRET_KEY"
  default_tags {
   tags = {
     Environment = "Test"
     ManagedBy   = "Terraform"
    }
  }
}