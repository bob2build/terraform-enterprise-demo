provider "aws" {
  version = "~> 1.0.0"
  region  = "us-east-1"
}

module "server" {
  source       = "hashicorp/consul/aws"
  aws_region   = "us-east-1"
  vpc_id       = "vpc-7e5e7506"
  ssh_key_name = "bob2build"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
}
