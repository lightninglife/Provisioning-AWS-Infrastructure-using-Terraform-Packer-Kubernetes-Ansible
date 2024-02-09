resource "aws_vpc" "all" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id            = aws_vpc.all.id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

}

# resource "aws_subnet" "all" {
#   count = length(var.subnet_cidr_blocks)

#   vpc_id           = aws_vpc.all.id
#   cidr_block       = var.subnet_cidr_blocks[count.index]
#   availability_zone = var.availability_zones[count.index] # Specify AZs explicitly
#   tags = {
#     Name = "${var.subnet}-${count.index + 1}"
#   }
#   map_public_ip_on_launch = var.aws_subnet_all_map_public_ip_on_launch # true
# }

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.all.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
}


resource "aws_internet_gateway" "all" {
  vpc_id = aws_vpc.all.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_nat_gateway" "all" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

}

resource "aws_eip" "nat" {
  count = length(var.availability_zones)
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.all.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.all.id
  }

}

# resource "aws_route_table" "all" {
#   vpc_id = aws_vpc.all.id

#   route {
#     cidr_block = var.web_cidr
#     gateway_id = aws_internet_gateway.all.id
#   }

#   tags = {
#     Name = var.rt_name
#   }
  
# }

resource "aws_route_table" "private" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.all.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.all[count.index].id
  }

}


# resource "aws_route_table_association" "all" {
#   count = length(aws_subnet.all)

#   subnet_id      = aws_subnet.all[count.index].id
#   route_table_id = aws_route_table.all.id

# }

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
