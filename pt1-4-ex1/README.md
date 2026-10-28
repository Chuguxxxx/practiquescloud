# Pt1.4 - Ejercicio 1: Instancias EC2 con Terraform

## 1. Objetivo

En este ejercicio utilizo Terraform para crear automáticamente dos instancias EC2 en AWS con Amazon Linux 2023, de tipo t3.micro y en la región us-east-1.

## 2. Configuración de Terraform

Primero creo el archivo `main.tf`, donde configuro el proveedor AWS y selecciono la región us-east-1.

Después utilizo el recurso `aws_instance` con `count = 2` para crear las dos máquinas. También asigno los nombres Instancia-1 e Instancia-2.

## 3. Despliegue de las instancias

Ejecuto los siguientes comandos:

- `terraform init`: inicializo Terraform y descargo el proveedor AWS.
- `terraform validate`: compruebo que el código sea correcto.
- `terraform plan`: reviso los recursos que se van a crear.
- `terraform apply`: creo las dos instancias EC2 en AWS.

## 4. Comprobación

Entro en la consola de AWS y compruebo que las dos instancias aparecen en estado Running, con el tipo t3.micro y en la región us-east-1.


## 5. Eliminación de recursos

Una vez terminadas las comprobaciones, utilizo `terraform destroy` para eliminar las instancias y evitar consumir presupuesto de AWS Academy.