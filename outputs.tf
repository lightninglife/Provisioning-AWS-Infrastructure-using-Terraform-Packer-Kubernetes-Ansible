output "security_group_name" {
  value = var.security_group_name
}

output "security_group_description" {
  value = var.security_group_description
}

output "security_group_name_eks_cluster" {
  value = var.security_group_name_eks_cluster
}

output "security_group_description_eks_cluster" {
  value = var.security_group_description_eks_cluster
}

output "web_cidr" {
  value = var.web_cidr
}

output "private_ip_address" {
  value = var.private_ip_address
}

output "protocol_web" {
  value = var.protocol_web
}

output "web_alb_name" {
  value = var.web_alb_name
}

output "web_alb_internal" {
  value = var.web_alb_internal
}

output "load_balancer_type_web" {
  value = var.load_balancer_type_web
}

output "web_tg_name" {
  value = var.web_tg_name
}

output "db_allocated_storage" {
  value = var.db_allocated_storage
}

output "db_storage_type" {
  value = var.db_storage_type
}

output "db_engine" {
  value = var.db_engine
}

output "db_engine_version" {
  value = var.db_engine_version
}

output "db_instance_class" {
  value = var.db_instance_class
}

output "db_name" {
  value = var.db_name
}

output "db_username" {
  value = var.db_username
}

output "db_password" {
  value = var.db_password
  sensitive = true
}

output "db_parameter_group_name" {
  value = var.db_parameter_group_name
}

output "skip_final_snapshot" {
  value = var.skip_final_snapshot
}

output "db_subnet_group_name" {
  value = var.db_subnet_group_name
}

output "subnet" {
  value = var.subnet
}

output "db_parameter_group_family" {
  value = var.db_parameter_group_family
}

output "db_parameter_server_name" {
  value = var.db_parameter_server_name
}

output "db_parameter_client_name" {
  value = var.db_parameter_client_name
}

output "character_set_server" {
  value = var.character_set_server
}

output "character_set_client" {
  value = var.character_set_client
}

output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

output "vpc_name" {
  value = var.vpc_name
}

output "public_subnet_cidr_blocks" {
  value = var.public_subnet_cidr_blocks
}

output "private_subnet_cidr_blocks" {
  value = var.private_subnet_cidr_blocks
}

output "availability_zones" {
  value = var.availability_zones
}

output "aws_subnet_all_map_public_ip_on_launch" {
  value = var.aws_subnet_all_map_public_ip_on_launch
}

output "igw_name" {
  value = var.igw_name
}

output "rt_name" {
  value = var.rt_name
}

output "rt_association" {
  value = var.rt_association
}

output "eks_cluster_ansible_name" {
  value = var.eks_cluster_ansible_name
}

output "aws_eks_node_group_ansible_name" {
  value = var.aws_eks_node_group_ansible_name
}

output "aws_eks_node_group_instance_types" {
  value = var.aws_eks_node_group_instance_types
}

output "aws_eks_node_group_desired_capacity" {
  value = var.aws_eks_node_group_desired_capacity
}

output "aws_eks_node_group_min_size" {
  value = var.aws_eks_node_group_min_size
}

output "aws_eks_node_group_max_size" {
  value = var.aws_eks_node_group_max_size
}

output "aws_eks_node_group_launch_template_name_prefix" {
  value = var.aws_eks_node_group_launch_template_name_prefix
}

output "aws_eks_node_group_launch_template_version" {
  value = var.aws_eks_node_group_launch_template_version
}

output "aws_eks_node_group_device_name" {
  value = var.aws_eks_node_group_device_name
}

output "aws_eks_node_group_volume_size" {
  value = var.aws_eks_node_group_volume_size
}

output "aws_eks_cluster_ansible_version" {
  value = var.aws_eks_cluster_ansible_version
}

output "aws_eks_addon_ansible_addon_name" {
  value = var.aws_eks_addon_ansible_addon_name
}

output "aws_eks_addon_ansible_addon_version" {
  value = var.aws_eks_addon_ansible_addon_version
}

output "aws_launch_template_web_name_prefix" {
  value = var.aws_launch_template_web_name_prefix
}

output "aws_launch_template_web_image_id" {
  value = var.aws_launch_template_web_image_id
}

output "aws_launch_template_web_instance_type" {
  value = var.aws_launch_template_web_instance_type
}

output "aws_launch_template_web_block_device_mappings_device_name" {
  value = var.aws_launch_template_web_block_device_mappings_device_name
}

output "aws_launch_template_web_block_device_mappings_volume_size" {
  value = var.aws_launch_template_web_block_device_mappings_volume_size
}

output "aws_launch_template_web_create_before_destroy" {
  value = var.aws_launch_template_web_create_before_destroy
}

output "aws_autoscaling_group_web_desired_capacity" {
  value = var.aws_autoscaling_group_web_desired_capacity
}

output "aws_autoscaling_group_web_max_size" {
  value = var.aws_autoscaling_group_web_max_size
}

output "aws_autoscaling_group_web_min_size" {
  value = var.aws_autoscaling_group_web_min_size
}

output "aws_autoscaling_group_web_launch_template_version" {
  value = var.aws_autoscaling_group_web_launch_template_version
}

output "aws_autoscaling_group_web_tag_key" {
  value = var.aws_autoscaling_group_web_tag_key
}

output "aws_autoscaling_group_web_tag_value" {
  value = var.aws_autoscaling_group_web_tag_value
}

output "aws_autoscaling_group_web_tag_propagate_at_launch" {
  value = var.aws_autoscaling_group_web_tag_propagate_at_launch
}

output "key_pair_name" {
  value = var.key_pair_name
}

output "aws_launch_template_ansible_name_prefix" {
  value = var.aws_launch_template_ansible_name_prefix
}

output "aws_launch_template_ansible_image_id" {
  value = var.aws_launch_template_ansible_image_id
}

output "aws_launch_template_ansible_instance_type" {
  value = var.aws_launch_template_ansible_instance_type
}