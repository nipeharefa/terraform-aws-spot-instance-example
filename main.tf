provider "aws" {
  region = "ap-southeast-1"
}

variable "ssh" {
  type = string
}

variable "instance_type" {
  type = string
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_spot_instance_request" "cheap_worker" {
  ami                    = "ami-01581ffba3821cdf3"
  instance_type          = var.instance_type
  block_duration_minutes = 120
  key_name               = var.ssh
  security_groups        = ["ec2-group"]

  tags = {
    Name = "CheapWorker"
  }
}