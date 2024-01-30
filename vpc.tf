resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "example_vpc"
  }
}

resource "aws_subnet" "example_subnet1" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "example_subnet1"
  }
}

resource "aws_subnet" "example_subnet2" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "example_subnet2"
  }
}

resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
  tags = {
    Name = "example_igw"
  }
}

resource "aws_route_table" "example_rt" {
  vpc_id = aws_vpc.example_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }
  tags = {
    Name = "example_rt"
  }
}

resource "aws_route_table_association" "example_rta1" {
  subnet_id      = aws_subnet.example_subnet1.id
  route_table_id = aws_route_table.example_rt.id
}

resource "aws_route_table_association" "example_rta2" {
  subnet_id      = aws_subnet.example_subnet2.id
  route_table_id = aws_route_table.example_rt.id
}