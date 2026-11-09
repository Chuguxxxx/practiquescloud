# Pt1.4 - Ejercicio 1: Instancias EC2 con Terraform

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
<img width="1089" height="573" alt="{A20592E1-8942-498C-B1DA-C7E8C189A8E3}" src="https://github.com/user-attachments/assets/d5f140d2-a977-4e7c-8cf0-b8a501d26372" />

<img width="1085" height="136" alt="{EF191CB3-A881-40D8-9DA0-B9985514F343}" src="https://github.com/user-attachments/assets/a49aece4-3d2c-4b9a-b934-26f6d4b3d81a" />

- `terraform apply`: creo las dos instancias EC2 en AWS.
<img width="1005" height="229" alt="{9EA10D89-35FA-4CCF-87F4-AEC7F76A0139}" src="https://github.com/user-attachments/assets/23296cbf-2bec-453f-877b-eece43a288dc" />

- Escribo "yes" para confimar
<img width="515" height="140" alt="{C584446B-CCBA-4A01-AB44-0040FF23A1F1}" src="https://github.com/user-attachments/assets/e0b3557d-e5f5-48a5-8473-a33cc3baf129" />
<img width="651" height="215" alt="{27B9BE53-02CC-4ABF-8555-E320BD618910}" src="https://github.com/user-attachments/assets/3b371fef-37c4-4b9d-b7a9-41da0e58210c" />

## 4. Comprobación

Entro en la consola de AWS y compruebo que las dos instancias aparecen en estado Running, con el tipo t3.micro y en la región us-east-1.
<img width="1165" height="74" alt="{87A772D0-E9AE-496D-B4CA-16070F07D64D}" src="https://github.com/user-attachments/assets/61ced8cf-1ec9-476e-8ad5-418cd186fc83" />
<img width="1190" height="74" alt="{66B1B573-83D2-4E82-9DBE-3A4ECF926857}" src="https://github.com/user-attachments/assets/212a8ef5-a167-4756-83e4-248493569a4e" />


## 5. Eliminación de recursos

Una vez terminadas las comprobaciones, utilizo `terraform destroy` para eliminar las instancias y evitar consumir presupuesto de AWS Academy.
<img width="1036" height="427" alt="{7F91B03A-E9F1-4267-910E-C01246F15014}" src="https://github.com/user-attachments/assets/036e2e88-7104-41a4-af4d-c0f4cac208f5" />
<img width="580" height="141" alt="{2D9CF50F-B617-4F88-8B09-7A863D2BB6BE}" src="https://github.com/user-attachments/assets/5568d34c-6f35-41ae-8ea0-176e48ff3f76" />
<img width="669" height="243" alt="{B3EE0625-9609-4128-AC70-10A4231093D6}" src="https://github.com/user-attachments/assets/91af1ff1-0cc2-47d7-9301-a1a9f98ceae5" />
