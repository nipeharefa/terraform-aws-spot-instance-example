provider "aws" {
  region = "ap-southeast-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_spot_instance_request" "cheap_worker" {
  ami           = "ami-01581ffba3821cdf3"
  instance_type = "c4.xlarge"
  block_duration_minutes = 120

  tags = {
    Name = "CheapWorker"
  }
}