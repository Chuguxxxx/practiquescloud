# VPC-03
resource "aws_vpc" "vpc_03" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "VPC-03"
    Project = var.project_name
  }
}

# Subred pública A
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.vpc_03.id
  cidr_block              = var.public_subnet_a_cidr
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true

  tags = {
    Name    = "Public Subnet A"
    Project = var.project_name
  }
}

# Subred pública B
resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.vpc_03.id
  cidr_block              = var.public_subnet_b_cidr
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true

  tags = {
    Name    = "Public Subnet B"
    Project = var.project_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_03.id

  tags = {
    Name    = "IGW-VPC-03"
    Project = var.project_name
  }
}

# Tabla de rutas pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_03.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name    = "RT-Public-VPC-03"
    Project = var.project_name
  }
}

# Asociación de las dos subredes a la tabla de rutas
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

# Security Group
resource "aws_security_group" "pt2_2" {
  name        = "pt2-2-sg"
  description = "SSH, ICMP interno y salida total"
  vpc_id      = aws_vpc.vpc_03.id

  ingress {
    description = "SSH desde cualquier origen"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ICMP desde la VPC"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "Todo el trafico saliente"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "SG-Pt2.2"
    Project = var.project_name
  }
}

# AMI más reciente de Amazon Linux 2023
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 A
resource "aws_instance" "ec2_a" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_a.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.pt2_2.id]
  associate_public_ip_address = true

  tags = {
    Name    = "ec2-a"
    Project = var.project_name
  }
}

# EC2 B
resource "aws_instance" "ec2_b" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_b.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.pt2_2.id]
  associate_public_ip_address = true

  tags = {
    Name    = "ec2-b"
    Project = var.project_name
  }
}
