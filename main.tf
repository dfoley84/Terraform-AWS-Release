terraform {
  backend "remote" {
    organization = "AWS_Dev_Test"
    workspaces {
      name = "dev"
    }
  }
}
provider "aws" {
  region = var.Dev
}

module "Network" {
  source = "./Network"
}

module "ElasticBean" {
  source = "./elasticbean"
  vpc_id = module.Network.vpc_id
  subnet_id = module.Network.public_subnet_id
}


