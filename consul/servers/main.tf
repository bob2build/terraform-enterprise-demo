provider "aws" {
  version = "~> 1.0.0"
  region  = "us-east-1"
}

module "server" {
  name         = "bob-tfe-demo"
  source       = "hashicorp/consul/aws"
  region       = "us-east-1"
  vpc_id       = "vpc-7e5e7506"
  ssh_key_name = "bob2build"
}
