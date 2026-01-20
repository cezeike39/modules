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
module "vpc" {
    source = "./modules/vpc"
    availability_zones = ["us-west-2a", "us-west-2b"]

}
  
module "eks" {
  source = "./modules/eks"
  depends_on = [ module.vpc ]
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids

}
