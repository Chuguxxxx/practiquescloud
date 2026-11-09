# Pt1.4 - Ejercicio 2: VPC, subredes y EC2

## 1. Objetivo

Crear una  VPC con tres subredes en AWS y desplegar dos instancias EC2 en cada una. Primero realizo la configuración manualmente desde AWS y después utilizo Terraform para automatizar el proceso.

## 2. Creación manual de la VPC

Entro en AWS y creo una VPC llamada `VPC-PT1.4-EX2` con la dirección `10.0.0.0/16` en la región `us-east-1`. Selecciono la opción VPC only para configurar las subredes por separado.

## 3. Creación de las subredes

Dentro de la VPC creo tres subredes llamadas Subnet-A, Subnet-B y Subnet-C, con las direcciones 10.0.32.0/25, 10.0.30.0/23 y 10.0.33.0/28. Las configuro en la zona de disponibilidad us-east-1a.

## 4. Creación manual de las instancias EC2

Desde la consola de AWS creo seis instancias EC2 con Amazon Linux 2023 y el tipo t3.micro. Asigno dos máquinas a cada subred y utilizo el mismo grupo de seguridad para todas. Después compruebo que las seis instancias aparecen en estado Running y en la zona de disponibilidad us-east-1a.

## 5. Despliegue con Terraform

*Pendiente de completar.*

## 6. Topología de red

*Pendiente de completar.*

## 7. Comprobación

*Pendiente de completar.*