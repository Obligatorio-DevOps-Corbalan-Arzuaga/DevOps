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