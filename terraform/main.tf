terraform {
  backend "s3" {
    bucket = "hany-terraformstate"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}

module "vpc" {
  source = "./vpc"
}

module "eks" {
  source              = "./eks"
  vpc_id              = module.vpc.id
  vpc_private_subnets = module.vpc.private_subnets
}