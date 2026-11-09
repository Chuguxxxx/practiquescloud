
# Configuracion de Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.1"
    }
  }
}

# Region de AWS
provider "aws" {
  region = "us-east-1"
}

# Variable para la direccion de la VPC
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# Creacion de la VPC
resource "aws_vpc" "principal" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "VPC-PT1.4-EX2"
  }
}

# Creacion de Subnet-A
resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.principal.id
  cidr_block        = "10.0.32.0/25"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet-A"
  }
}

# Creacion de Subnet-B
resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.principal.id
  cidr_block        = "10.0.30.0/23"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet-B"
  }
}

# Creacion de Subnet-C
resource "aws_subnet" "subnet_c" {
  vpc_id            = aws_vpc.principal.id
  cidr_block        = "10.0.33.0/28"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet-C"
  }
}

# Grupo de seguridad para las instancias
resource "aws_security_group" "ec2" {
  name        = "SG-PT1.4-EX2"
  description = "Grupo de seguridad de las instancias"
  vpc_id      = aws_vpc.principal.id

  tags = {
    Name = "SG-PT1.4-EX2"
  }
}

# Dos instancias EC2 en Subnet-A
resource "aws_instance" "ec2_a" {
  count                       = 2
  ami                         = "ami-04b938437b69a2c9c"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.subnet_a.id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = false

  tags = {
    Name = "EC2-A${count.index + 1}"
  }
}

# Dos instancias EC2 en Subnet-B
resource "aws_instance" "ec2_b" {
  count                       = 2
  ami                         = "ami-04b938437b69a2c9c"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.subnet_b.id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = false

  tags = {
    Name = "EC2-B${count.index + 1}"
  }
}

# Dos instancias EC2 en Subnet-C
resource "aws_instance" "ec2_c" {
  count                       = 2
  ami                         = "ami-04b938437b69a2c9c"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.subnet_c.id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = false

  tags = {
    Name = "EC2-C${count.index + 1}"
  }
}
