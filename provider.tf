terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "chisomp-bucket"
    key            = "eks/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-eks-state"
    encrypt        = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  

}