
terraform {
  backend "s3" {
    bucket = "343872947804-terraform-tfstate"
    key    = "dev/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-tfstate-lock"
  }
    #required_version = "~=1.1.8"
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }
}


provider "aws" {
  region = "eu-central-1"
}
