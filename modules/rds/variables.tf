# RDS Database variables
variable "db_allocated_storage" {
  description = "Allocated storage for the RDS database"
  type        = number
}

variable "db_storage_type" {
  description = "Storage type for the RDS database"
  type        = string
}

variable "db_engine" {
  description = "Database engine for the RDS instance"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version for the RDS instance"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the RDS database"
  type        = string
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
}

variable "db_parameter_group_name" {
  description = "Parameter group name for the RDS instance"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot when deleting the RDS instance"
  type        = bool
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "subnets" {
  description = "subnets"
  type        = list(string)
}

variable "security_group" {
  description = "security_group"
  type        = string
}

variable "db_parameter_group_family" {
  description = "The family of the DB parameter group."
  type        = string
   # Set your desired default family here
}

variable "db_parameter_server_name" {
  description = "Name for the 'character_set_server' parameter"
  type        = string
}

variable "db_parameter_client_name" {
  description = "Name for the 'character_set_client' parameter"
  type        = string
}

variable "character_set_server" {
  description = "Value for the 'character_set_server' parameter"
  type        = string
}

variable "character_set_client" {
  description = "Value for the 'character_set_client' parameter"
  type        = string
}



