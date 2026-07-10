#1.vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform-vpc"
  }
}

#2.public subnet 
resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_cidr

  availability_zone = var.public_az

  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-public-subnet1"
  }
}

#3. private subnet
resource "aws_subnet" "private_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_cidr

  availability_zone = var.private_az

  tags = {
    Name = "terraform-private-subnet1"
  }
}

#4.Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-igw"
  }
}

#5. public Route Table

resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-public-rt"
  }
}

#6. private Route Table

resource "aws_route_table" "private_rt" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-private-rt"
  }
}

#7.Add public route
resource "aws_route" "public_route" {

  route_table_id = aws_route_table.public_rt.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = aws_internet_gateway.igw.id

}

#8. Public Route Table Association

resource "aws_route_table_association" "public_assoc" {

  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_rt.id
}

#9. Private route table association

resource "aws_route_table_association" "private_assoc" {
  subnet_id = aws_subnet.private_subnet.id

  route_table_id = aws_route_table.private_rt.id
}

#10. Security Group

resource "aws_security_group" "web_sg" {

  name        = "web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

dynamic "ingress" {
  for_each = var.allowed_ports

  content {
    from_port   = ingress.value
    to_port     = ingress.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    description = "Port ${ingress.value}"
  }
}

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

