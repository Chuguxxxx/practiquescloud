output "vpc_id" {
  description = "ID de la VPC-03"
  value       = aws_vpc.vpc_03.id
}

output "vpc_cidr" {
  description = "Rango CIDR de la VPC-03"
  value       = aws_vpc.vpc_03.cidr_block
}

output "public_subnet_a_id" {
  description = "ID de la subred pública A"
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "ID de la subred pública B"
  value       = aws_subnet.public_b.id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  description = "ID de la tabla de rutas pública"
  value       = aws_route_table.public.id
}

output "security_group_id" {
  description = "ID del Security Group"
  value       = aws_security_group.pt2_2.id
}

output "ec2_a_id" {
  description = "ID de la instancia ec2-a"
  value       = aws_instance.ec2_a.id
}

output "ec2_b_id" {
  description = "ID de la instancia ec2-b"
  value       = aws_instance.ec2_b.id
}

output "ec2_a_public_ip" {
  description = "IP pública de ec2-a"
  value       = aws_instance.ec2_a.public_ip
}

output "ec2_b_public_ip" {
  description = "IP pública de ec2-b"
  value       = aws_instance.ec2_b.public_ip
}

output "ssh_ec2_a" {
  description = "Comando SSH para ec2-a"
  value       = "ssh -i vockey.pem ec2-user@${aws_instance.ec2_a.public_ip}"
}

output "ssh_ec2_b" {
  description = "Comando SSH para ec2-b"
  value       = "ssh -i vockey.pem ec2-user@${aws_instance.ec2_b.public_ip}"
}
