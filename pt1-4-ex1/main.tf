terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.1"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "servidores" {
  count         = 2
  ami           = "ami-04b938437b69a2c9c"
  instance_type = "t3.micro"

  tags = {
    Name = "Instancia-${count.index + 1}"
  }
}