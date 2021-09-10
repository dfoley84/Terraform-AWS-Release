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
