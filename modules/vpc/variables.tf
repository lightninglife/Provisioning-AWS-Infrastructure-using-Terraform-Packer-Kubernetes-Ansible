# VPC variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

# Subnet variables
variable "public_subnet_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "subnet" {
  description = "Name of the subnet"
  type        = string
}


# Internet Gateway variables
variable "igw_name" {
  description = "Name for the Internet Gateway"
  type        = string
}

# Route Table variables
variable "rt_name" {
  description = "Name for the Route Table"
  type        = string
}

# Route Table Association variables
variable "rt_association" {
  description = "Name prefix for Route Table Association"
  type        = string
}

variable "web_cidr" {
  description = "Cidr block for web"
  type        = string
}

variable "availability_zones" {
  type    = list(string)
}

variable "aws_subnet_all_map_public_ip_on_launch" {
  description = "Set to true to enable auto-assign public IP address for all subnets"
  type        = bool
}