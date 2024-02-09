resource "aws_db_instance" "rds" {
  allocated_storage    = var.db_allocated_storage
  storage_type         = var.db_storage_type
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = aws_db_parameter_group.default.name
  skip_final_snapshot  = var.skip_final_snapshot
  vpc_security_group_ids = [var.security_group]
  db_subnet_group_name = aws_db_subnet_group.rds.name
  

}

resource "aws_db_subnet_group" "rds" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnets
  # family = var.db_parameter_group_family
}

resource "aws_db_parameter_group" "default" {
  name   = var.db_parameter_group_name
  family = var.db_parameter_group_family

  parameter {
    name  = var.db_parameter_server_name
    value = var.character_set_server
  }

  parameter {
    name  = var.db_parameter_client_name
    value = var.character_set_client
  }
}
