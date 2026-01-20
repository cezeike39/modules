
module "vpc" {
    source = "./modules/vpc"
    availability_zones = ["us-west-2a", "us-west-2b"]

}
  
module "eks" {
  source = "./modules/eks"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids


  depends_on = [ module.vpc ]

}
