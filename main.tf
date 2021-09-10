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
  profile = "production"
}

module "Network" {
  source = "./Network"
}
