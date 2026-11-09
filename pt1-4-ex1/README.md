<img width="398" height="284" alt="{3FA88AC3-EC3C-4C95-B976-58A8D76C0F3D}" src="https://github.com/user-attachments/assets/be9967d8-a32b-4a54-9ec9-2a56ebc3e48c" /># Pt1.4 - Ejercicio 1: Instancias EC2 con Terraform

## 1. Mi objetivo

En este ejercicio utilizo Terraform para crear automáticamente dos instancias EC2 en AWS con Amazon Linux 2023, de tipo t3.micro y en la región us-east-1.

## 2. Configuración de Terraform

Primero creo el archivo `main.tf`, donde configuro el proveedor AWS y selecciono la región us-east-1.

Después utilizo el recurso `aws_instance` con `count = 2` para crear las dos máquinas. También asigno los nombres Instancia-1 e Instancia-2.
<img width="398" height="284" alt="{3FA88AC3-EC3C-4C95-B976-58A8D76C0F3D}" src="https://github.com/user-attachments/assets/6ff23e97-0ed8-4309-9771-5ada25f2f8c3" />

## 3. Despliegue de las instancias

Ejecuto los siguientes comandos:

- `terraform init`: inicializo Terraform y descargo el proveedor AWS.
<img width="654" height="339" alt="{04681998-4FBB-4DC6-BB97-9C4AA427A18E}" src="https://github.com/user-attachments/assets/3e3e8e85-ff6d-4dfd-8740-71d846d7dce9" />

- `terraform validate`: compruebo que el código sea correcto.
<img width="495" height="132" alt="{70FA0331-4B5D-493A-82E3-CACD15E591DF}" src="https://github.com/user-attachments/assets/5eeaaa15-e6a2-4d1f-aae9-bc7c5c67216f" />

- `terraform plan`: reviso los recursos que se van a crear.

- `terraform apply`: creo las dos instancias EC2 en AWS.

## 4. Comprobación

Entro en la consola de AWS y compruebo que las dos instancias aparecen en estado Running, con el tipo t3.micro y en la región us-east-1.


## 5. Eliminación de recursos

Una vez terminadas las comprobaciones, utilizo `terraform destroy` para eliminar las instancias y evitar consumir presupuesto de AWS Academy.
