# Obligatorio DevOps 2024
## Grupo: Santiago Arzuaga - Matias Corbalan

### Presentacion del problema:

Una empresa presento problemas en la comprension y comunicacion entre los equipos de desarrollo y operaciones. Este problema se vio evidenciado al momento de entregar su producto al mercado, donde a pesar de utilizar las ultimas herramientas y tecnologias, se presentaron errore e inconvenientes inesperados, afectando tanto a la empresa, como a sus usuarios.

Era evidente que la causa del problema no era tecnica, sino cultural y organizativa, donde el equipo de desarrollo y operaciones no se comunicaban eficientemente, y cada equipo velaba por sus tareas y responsabiliad por separado.

Para resolverlo, la empresa identificó la necesidad de un cambio cultural profundo que fomentara la colaboración, la transparencia y la alineación de objetivos entre los equipos, superando así los desafíos actuales y estableciendo las bases para operaciones más ágiles y resilientes a futuro.

### Solucion presentada:

Para abordar los desafíos identificados, se implemento un plan que transformó la forma en que los equipos de desarrollo y operaciones colaboran, centrándose en la adopción de ciclos de integración y despliegue continuo (CI/CD), y el uso de tecnologías como Docker, GitHub Actions, AWS Fargate, VPC y Amazon Elastic Container Registry (ECR) para facilitar el flujo desde que un desarrollador realiza un cambio, hasta que este se vea reflejado en el mercado.

### Herramientas y tecnologias utilizadas:

**Docker:**
Para crear contenedores que empaquetan la aplicación y sus dependencias, garantizando consistencia entre entornos.

**AWS con ECS:**
Para orquestar y gestionar los contenedores de manera eficiente en la nube.

**Fargate:** Para ejecutar contenedores sin necesidad de gestionar servidores, simplificando la escalabilidad.

**VPC:** Para crear un entorno de red seguro y aislado donde se ejecutan los recursos del proyecto.

**Load Balancer:** Para distribuir el tráfico de manera eficiente entre instancias, asegurando alta disponibilidad.

**GitHub Actions:** Para automatizar pipelines CI/CD, incluyendo pruebas, construcción y despliegue de la aplicación.

**Terraform:** Para definir y aprovisionar la infraestructura en AWS de manera declarativa y repetible.

**ECR:** Para almacenar y gestionar de forma segura las imágenes Docker utilizadas en los despliegues.

**Trello:** Para gestionar tareas y coordinar el trabajo de los equipos de manera visual y ágil.

**SonarCloud:** Para analizar la calidad del código, identificar problemas y garantizar estándares de desarrollo.

## Terraform:

Utilizamos Terraform como herramienta de infraestructura como codigo, automatizando la creación de la infraestructura necesaria para una aplicación en AWS. Configurando una red segura, establece subredes, habilitando la conexión a Internet, gestionando el tráfico de red y desplegando la aplicación en contenedores Docker de forma escalable utilizando AWS ECS y Fargate, lo que permite ejecutar los contenedores sin necesidad de administrar las máquinas físicas. Un Elastic Load Balancer se encarga de distribuir el tráfico entre los contenedores, mientras que un Security Group regula el acceso a la aplicación.

Mediante terraform, creamos los recursos de AWS:

**VPC**: Una red virtual privada por ambiente, donde se alojaran todos los aplicativos de un mismo ambiente.

**Internet Gateway**: Para permitir el acceso a internet desde la VPC.

**Subnets**: Dos subredes publicas por VPC, en dos diferentes zonas de disponiblidad, us-east-1b y us-east-2b.

**Route Table**: Para gestionar el trafico entre las subredes y la VPC mediante el Internet Gateway.

**Security groups**: Un grupo de seguridad por ambiente, que permite el trafico HTTP en el puerto 80 de las subredes.

**Load Balancer**: Un balanceador de carga por cada aplicativo en cada ambiente, que distribuye las solicitudes en las multiples instancias de un aplicativo.

**Target Group**: Para definir las instancias en las que el LB distribuira el trafico.

**ECS clusters**: Un contenedor virtual por ambiente, donde se alojaran los 4 contendores Docker de los aplicativos BackEnd de un mismo ambiente.

**Task definitions**: Para definir como ese ejecutaran los contendores Docker. Se utiliza el servicio Fargate para simplificar la administracion la insfraestructura.

**ECS Services**: Para administrar el numero de contenedor a ejecutar y mantener la aplicacion estable.