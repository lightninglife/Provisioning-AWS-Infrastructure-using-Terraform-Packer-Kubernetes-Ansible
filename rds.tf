resource "aws_db_instance" "example_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "dbuser"
  password             = "dbpassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.example_rds_subnet_group.name
}

resource "aws_db_subnet_group" "example_rds_subnet_group" {
  name       = "example-rds-subnet-group"
  subnet_ids = [aws_subnet.example_subnet1.id, aws_subnet.example_subnet2.id]
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow DB traffic"
  vpc_id      = aws_vpc.example_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Adjust based on your network configuration
  }
}
