terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }

  backend "s3" {
    bucket  = "devops-api-state-bucket-tf"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
    profile = "admin"
  }
}

provider "aws" {
  profile = "admin"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  # Não podemos deletar esse bucket, pois ele é usado para armazenar o estado do Terraform
  lifecycle {
    prevent_destroy = true
  }
}