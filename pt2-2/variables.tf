variable "aws_region" {
  description = "Región de AWS donde se despliega la práctica"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Rango CIDR de la VPC-03"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "Rango CIDR de la subred pública A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "Rango CIDR de la subred pública B"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_a" {
  description = "Zona de disponibilidad de la subred pública A"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "Zona de disponibilidad de la subred pública B"
  type        = string
  default     = "us-east-1b"
}

variable "instance_type" {
  description = "Tipo de instancia de las máquinas EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Par de claves de AWS Academy"
  type        = string
  default     = "vockey"
}

variable "project_name" {
  description = "Nombre del proyecto usado en las etiquetas"
  type        = string
  default     = "Pt2.2"
}
