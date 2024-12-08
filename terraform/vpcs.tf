
# ----------------------------------------------------------------------------------------------------------------------------
#                                          PORD
# ----------------------------------------------------------------------------------------------------------------------------

resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod_vpc"
  }
}

resource "aws_internet_gateway" "prod" {
  
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "prod-internet-gateway"
  }
}

# Se crean las subnets, dos por ambiente (con diferentes zonas de disponibilidad para el LB)
resource "aws_subnet" "prod_public_subnet_1" {
  
  vpc_id = aws_vpc.prod_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "prod-subnet-1"
  }
}

resource "aws_subnet" "prod_public_subnet_2" {
  vpc_id = aws_vpc.prod_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "prod-subnet-2"
  }
}

# Crear route table
resource "aws_route_table" "prod" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod.id
  }
}

# Asociar la table a las subnets
resource "aws_route_table_association" "prod_association" {
  subnet_id      = aws_subnet.prod_public_subnet_1.id
  route_table_id = aws_route_table.prod.id
}

resource "aws_route_table_association" "prod_association_2" {
  subnet_id      = aws_subnet.prod_public_subnet_2.id
  route_table_id = aws_route_table.prod.id
}

# Se crean los Security Group
resource "aws_security_group" "prod_sg" {
  name        = "prod-sg"
  description = "Security group para prod"
  vpc_id = aws_vpc.prod_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "prod-sg"
  }
}

# ----------------------------------------------------------------------------------------------------------------------------
#                                          STAGING
# ----------------------------------------------------------------------------------------------------------------------------
resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "staging-vpc"
  }
}

resource "aws_internet_gateway" "staging" {
  
  vpc_id = aws_vpc.staging_vpc.id

  tags = {
    Name = "staging-internet-gateway"
  }
}

# Se crean las subnets, dos por ambiente (con diferentes zonas de disponibilidad para el LB)
resource "aws_subnet" "staging_public_subnet_1" {
  
  vpc_id = aws_vpc.staging_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "staging-subnet-1"
  }
}

resource "aws_subnet" "staging_public_subnet_2" {
  vpc_id = aws_vpc.staging_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "staging-subnet-2"
  }
}

# Crear route table
resource "aws_route_table" "staging" {
  vpc_id = aws_vpc.staging_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.staging.id
  }
}

# Asociar la table a las subnets
resource "aws_route_table_association" "staging_association" {
  subnet_id      = aws_subnet.staging_public_subnet_1.id
  route_table_id = aws_route_table.staging.id
}

resource "aws_route_table_association" "staging_association_2" {
  subnet_id      = aws_subnet.staging_public_subnet_2.id
  route_table_id = aws_route_table.staging.id
}

# Se crean los Security Group
resource "aws_security_group" "staging_sg" {
  name        = "staging-sg"
  description = "Security group para staging"
  vpc_id = aws_vpc.staging_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "staging-sg"
  }
}

# ----------------------------------------------------------------------------------------------------------------------------
#                                          DEVELOP
# ----------------------------------------------------------------------------------------------------------------------------
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_internet_gateway" "dev" {
  
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "dev-internet-gateway"
  }
}

# Se crean las subnets, dos por ambiente (con diferentes zonas de disponibilidad para el LB)
resource "aws_subnet" "dev_public_subnet_1" {
  
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-subnet-1"
  }
}

resource "aws_subnet" "dev_public_subnet_2" {
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "dev-subnet-2"
  }
}

# Crear route table
resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }
}

# Asociar la table a las subnets
resource "aws_route_table_association" "ddev_association" {
  subnet_id      = aws_subnet.dev_public_subnet_1.id
  route_table_id = aws_route_table.dev.id
}

resource "aws_route_table_association" "dev_association_2" {
  subnet_id      = aws_subnet.dev_public_subnet_2.id
  route_table_id = aws_route_table.dev.id
}

# Asecurity_group
resource "aws_security_group" "dev_sg" {
  name        = "dev-sg"
  description = "Security group para dev"
  vpc_id = aws_vpc.dev_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev-sg"
  }
}