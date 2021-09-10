provider "aws" {
  region = var.Dev
  profile = "production"
}

module "Network" {
  source = "./Network"
}
