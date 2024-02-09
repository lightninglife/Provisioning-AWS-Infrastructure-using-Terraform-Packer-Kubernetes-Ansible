# # VPC
# output "subnet_ids" {
#   description = "List of subnet IDs in the VPC"
#   value       = aws_subnet.all[*].id
#   type        = list(string)
# }

# # Security Group
# output "security_group_name" {
#   description = "Name of the AWS security group"
#   value       = var.security_group_name
#   type        = string
# }

# output "vpc_id" {
#   description = "ID of the VPC where the security group was created"
#   value       = var.vpc_id
#   type        = string
# }

# output "port_80" {
#   description = "Port for HTTP traffic (e.g., 80)"
#   value       = var.port_80
#   type        = number
# }

# output "port_443" {
#   description = "Port for HTTPS traffic (e.g., 443)"
#   value       = var.port_443
#   type        = number
# }

# output "port_22" {
#   description = "Port for SSH access (e.g., 22)"
#   value       = var.port_22
#   type        = number
# }

# output "port_8080" {
#   description = "Port for HTTP access for Jenkins (e.g., 8080)"
#   value       = var.port_8080
#   type        = number
# }

# output "port_3306" {
#   description = "Port for MySQL access for RDS (e.g., 3306)"
#   value       = var.port_3306
#   type        = number
# }

# output "security_group_protocol" {
#   description = "Protocol for the security group rules (e.g., 'tcp', 'udp', 'icmp', etc.)"
#   value       = var.security_group_protocol
#   type        = string
# }

# output "web_cidr" {
#   description = "CIDR block for incoming HTTP and HTTPS traffic"
#   value       = var.web_cidr
#   type        = string
# }

# output "private_ip_address" {
#   description = "CIDR block for private IP addresses (e.g., for SSH, Jenkins, MySQL)"
#   value       = var.private_ip_address
#   type        = string
# }

# # ALB for Jenkins
# output "jenkins_alb_name" {
#   description = "Name of the Jenkins ALB"
#   value       = var.jenkins_alb_name
#   type        = string
# }

# output "jenkins_alb_internal" {
#   description = "Whether the Jenkins ALB is internal"
#   value       = var.jenkins_alb_internal
#   type        = bool
# }

# output "load_balancer_type_alb" {
#   description = "Type of the load balancer for Jenkins ALB"
#   value       = var.load_balancer_type_alb
#   type        = string
# }

# output "enable_deletion_protection" {
#   description = "Whether to enable deletion protection for Jenkins ALB"
#   value       = var.enable_deletion_protection
#   type        = bool
# }

# output "enable_http2" {
#   description = "Whether to enable HTTP/2 for Jenkins ALB"
#   value       = var.enable_http2
#   type        = bool
# }

# output "enable_cross_zone_load_balancing" {
#   description = "Whether to enable cross-zone load balancing for Jenkins ALB"
#   value       = var.enable_cross_zone_load_balancing
#   type        = bool
# }

# output "alb_security_group_ids" {
#   description = "List of security group IDs for Jenkins ALB"
#   value       = var.alb_security_group_ids
#   type        = list(string)
# }

# # ALB Listener for Jenkins
# output "jenkins_listener_port" {
#   description = "Port for Jenkins ALB Listener"
#   value       = var.port_8080
#   type        = number
# }

# output "jenkins_listener_protocol" {
#   description = "Protocol for Jenkins ALB Listener"
#   value       = var.protocol_web
#   type        = string
# }

# output "jenkins_listener_type" {
#   description = "Type of action for Jenkins ALB Listener"
#   value       = var.jenkins_listener_type
#   type        = string
# }

# output "jenkins_listener_content_type" {
#   description = "Content type for Jenkins ALB Listener"
#   value       = var.jenkins_listener_content_type
#   type        = string
# }

# output "jenkins_listener_status_code" {
#   description = "Status code for Jenkins ALB Listener"
#   value       = var.jenkins_listener_status_code
#   type        = string
# }

# output "jenkins_listener_message_body" {
#   description = "Message body for Jenkins ALB Listener"
#   value       = var.jenkins_listener_message_body
#   type        = string
# }

# # ALB for Web Servers
# output "web_alb_name" {
#   description = "Name of the example web ALB"
#   value       = var.web_alb_name
#   type        = string
# }

# output "web_alb_internal" {
#   description = "Whether the example web ALB is internal"
#   value       = var.web_alb_internal
#   type        = bool
# }

# output "load_balancer_type_web" {
#   description = "Type of the load balancer for example web ALB"
#   value       = var.load_balancer_type_web
#   type        = string
# }

# # ALB Target Group for Web Servers
# output "web_tg_name" {
#   description = "Name of the example web Target Group"
#   value       = var.web_tg_name
#   type        = string
# }

# output "web_tg_port" {
#   description = "Port for example web Target Group"
#   value       = var.port_80
#   type        = number
# }

# # ALB Listener for Web Servers
# output "web_listener_type" {
#   description = "Type of action for example web ALB Listener"
#   value       = var.web_listener_type
#   type        = string
# }

# # RDS
# # RDS Database outputs
# output "db_allocated_storage" {
#   description = "Allocated storage for the RDS database"
#   value       = var.db_allocated_storage
#   type        = number
# }

# output "db_storage_type" {
#   description = "Storage type for the RDS database"
#   value       = var.db_storage_type
#   type        = string
# }

# output "db_engine" {
#   description = "Database engine for the RDS instance"
#   value       = var.db_engine
#   type        = string
# }

# output "db_engine_version" {
#   description = "Database engine version for the RDS instance"
#   value       = var.db_engine_version
#   type        = string
# }

# output "db_instance_class" {
#   description = "Instance class for the RDS database"
#   value       = var.db_instance_class
#   type        = string
# }

# output "db_name" {
#   description = "Name of the RDS database"
#   value       = var.db_name
#   type        = string
# }

# output "db_username" {
#   description = "Username for the RDS database"
#   value       = var.db_username
#   type        = string
# }

# output "db_password" {
#   description = "Password for the RDS database"
#   value       = var.db_password
#   type        = string
# }

# output "db_parameter_group_name" {
#   description = "Parameter group name for the RDS instance"
#   value       = var.db_parameter_group_name
#   type        = string
# }

# output "skip_final_snapshot" {
#   description = "Skip final snapshot when deleting the RDS instance"
#   value       = var.skip_final_snapshot
#   type        = bool
# }

# output "db_subnet_group_name" {
#   description = "Name of the DB subnet group"
#   value       = var.db_subnet_group_name
#   type        = string
# }

# # VPC
# # VPC outputs
# output "vpc_cidr_block" {
#   description = "CIDR block for the VPC"
#   value       = var.vpc_cidr_block
#   type        = string
# }

# output "vpc_name" {
#   description = "Name for the VPC"
#   value       = var.vpc_name
#   type        = string
# }

# # Subnet outputs
# output "subnet_cidr_blocks" {
#   description = "List of CIDR blocks for subnets"
#   value       = var.subnet_cidr_blocks
#   type        = list(string)
# }

# output "subnet_name" {
#   description = "Name prefix for subnets"
#   value       = var.subnet_name
#   type        = string
# }

# # Internet Gateway outputs
# output "igw_name" {
#   description = "Name for the Internet Gateway"
#   value       = var.igw_name
#   type        = string
# }

# # Route Table outputs
# output "web_cidr" {
#   description = "CIDR block for the web route"
#   value       = var.web_cidr
#   type        = string
# }

# output "rt_name" {
#   description = "Name for the Route Table"
#   value       = var.rt_name
#   type        = string
# }

# # Route Table Association outputs
# output "rt_association" {
#   description = "Name prefix for Route Table Association"
#   value       = var.rt_association
#   type        = string
# }

# # EKS
# output "eks_cluster_ansible_name" {
#   description = "Name of the Ansible EKS cluster"
#   value       = var.eks_cluster_ansible_name
#   type        = string
# }

# output "aws_eks_node_group_ansible_name" {
#   description = "Name of the Ansible EKS node group"
#   value       = var.aws_eks_node_group_ansible_name
#   type        = string
# }

# output "aws_eks_node_group_instance_types" {
#   description = "Instance types for the EKS node group"
#   value       = var.aws_eks_node_group_instance_types
#   type        = list(string)
# }

# output "aws_eks_node_group_desired_capacity" {
#   description = "Desired capacity for the EKS node group"
#   value       = var.aws_eks_node_group_desired_capacity
#   type        = number
# }

# output "aws_eks_node_group_min_size" {
#   description = "Minimum size for the EKS node group"
#   value       = var.aws_eks_node_group_min_size
#   type        = number
# }

# output "aws_eks_node_group_max_size" {
#   description = "Maximum size for the EKS node group"
#   value       = var.aws_eks_node_group_max_size
#   type        = number
# }

# output "aws_eks_node_group_launch_template_name_prefix" {
#   description = "Name prefix for the EKS node group launch template"
#   value       = var.aws_eks_node_group_launch_template_name_prefix
#   type        = string
# }

# output "aws_eks_node_group_launch_template_version" {
#   description = "Version for the EKS node group launch template"
#   value       = var.aws_eks_node_group_launch_template_version
#   type        = string
# }

# output "aws_eks_node_group_device_name" {
#   description = "Device name for the EKS node group block device mappings"
#   value       = var.aws_eks_node_group_device_name
#   type        = string
# }

# output "aws_eks_node_group_volume_size" {
#   description = "Volume size for the EKS node group block device mappings"
#   value       = var.aws_eks_node_group_volume_size
#   type        = number
# }

# output "eks_cluster_jenkins_name" {
#   description = "Name of the Jenkins EKS cluster"
#   value       = var.eks_cluster_jenkins_name
#   type        = string
# }

# output "kubernetes_deployment_jenkins_metadata_name" {
#   description = "Name of the Jenkins Deployment metadata"
#   value       = var.kubernetes_deployment_jenkins_metadata_name
#   type        = string
# }

# output "kubernetes_deployment_jenkins_spec_replicas" {
#   description = "Number of replicas for the Jenkins Deployment"
#   value       = var.kubernetes_deployment_jenkins_spec_replicas
#   type        = number
# }

# output "kubernetes_deployment_jenkins_spec_selector_app" {
#   description = "App label for the Jenkins Deployment spec"
#   value       = var.kubernetes_deployment_jenkins_spec_selector_app
#   type        = string
# }

# output "kubernetes_deployment_jenkins_spec_node_affinity_key" {
#   description = "Node affinity key for Jenkins Deployment"
#   value       = var.kubernetes_deployment_jenkins_spec_node_affinity_key
#   type        = string
# }

# output "kubernetes_deployment_jenkins_spec_node_affinity_operator" {
#   description = "Node affinity operator for Jenkins Deployment"
#   value       = var.kubernetes_deployment_jenkins_spec_node_affinity_operator
#   type        = string
# }

# output "kubernetes_deployment_jenkins_spec_containers_name" {
#   description = "Name of the Jenkins container in Deployment spec"
#   value       = var.kubernetes_deployment_jenkins_spec_containers_name
#   type        = string
# }

# output "kubernetes_deployment_jenkins_spec_containers_image" {
#   description = "Docker image for Jenkins container in Deployment spec"
#   value       = var.kubernetes_deployment_jenkins_spec_containers_image
#   type        = string
# }

# output "kubernetes_deployment_jenkins_spec_containers_ports" {
#   description = "Port for the Jenkins container in Deployment spec"
#   value       = var.kubernetes_deployment_jenkins_spec_containers_ports
#   type        = number
# }

# output "port_80" {
#   description = "Port 80"
#   value       = var.port_80
#   type        = number
# }

# output "port_8080" {
#   description = "Port 8080"
#   value       = var.port_8080
#   type        = number
# }

# output "kubernetes_service_jenkins_master_service_metadata_name" {
#   description = "Name of the Jenkins Master Service metadata"
#   value       = var.kubernetes_service_jenkins_master_service_metadata_name
#   type        = string
# }

# output "kubernetes_service_jenkins_master_service_spec_selector_app" {
#   description = "App label for the Jenkins Master Service spec"
#   value       = var.kubernetes_service_jenkins_master_service_spec_selector_app
#   type        = string
# }

# output "kubernetes_service_jenkins_master_service_spec_type" {
#   description = "Type of the Jenkins Master Service"
#   value       = var.kubernetes_service_jenkins_master_service_spec_type
#   type        = string
# }

# output "kubernetes_config_map_jenkins_config_metadata_name" {
#   description = "Name of the Jenkins ConfigMap metadata"
#   value       = var.kubernetes_config_map_jenkins_config_metadata_name
#   type        = string
# }

# output "kubernetes_config_map_jenkins_config_data" {
#   description = "Data for the Jenkins ConfigMap"
#   value       = var.kubernetes_config_map_jenkins_config_data
#   type        = string
# }

# output "kubernetes_network_policy_jenkins_network_policy_metadata_name" {
#   description = "Name of the Jenkins Network Policy metadata"
#   value       = var.kubernetes_network_policy_jenkins_network_policy_metadata_name
#   type        = string
# }

# output "kubernetes_network_policy_jenkins_network_policy_spec_pod_selector_app" {
#   description = "App label for the Jenkins Network Policy spec"
#   value       = var.kubernetes_network_policy_jenkins_network_policy_spec_pod_selector_app
#   type        = string
# }

# output "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_metadata_name" {
#   description = "Name of the Jenkins Horizontal Pod Autoscaler metadata"
#   value       = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_metadata_name
#   type        = string
# }

# # Auto Scaling Group
# output "aws_launch_template_web_name_prefix" {
#   description = "Name prefix for the AWS launch template"
#   value       = var.aws_launch_template_web_name_prefix
#   type        = string
# }

# output "aws_launch_template_web_image_id" {
#   description = "AMI ID for the AWS launch template"
#   value       = var.aws_launch_template_web_image_id
#   type        = string
# }

# output "aws_launch_template_web_instance_type" {
#   description = "Instance type for the AWS launch template"
#   value       = var.aws_launch_template_web_instance_type
#   type        = string
# }

# output "aws_launch_template_web_block_device_mappings_device_name" {
#   description = "Device name for block device mappings in the AWS launch template"
#   value       = var.aws_launch_template_web_block_device_mappings_device_name
#   type        = string
# }

# output "aws_launch_template_web_block_device_mappings_volume_size" {
#   description = "Volume size for block device mappings in the AWS launch template"
#   value       = var.aws_launch_template_web_block_device_mappings_volume_size
#   type        = number
# }

# output "aws_launch_template_web_create_before_destroy" {
#   description = "Lifecycle setting for create_before_destroy in the AWS launch template"
#   value       = var.aws_launch_template_web_create_before_destroy
#   type        = bool
# }

# output "aws_autoscaling_group_web_desired_capacity" {
#   description = "Desired capacity for the AWS Auto Scaling Group"
#   value       = var.aws_autoscaling_group_web_desired_capacity
#   type        = number
# }

# output "aws_autoscaling_group_web_max_size" {
#   description = "Maximum size for the AWS Auto Scaling Group"
#   value       = var.aws_autoscaling_group_web_max_size
#   type        = number
# }

# # iam 
# output "aws_iam_role_eks_cluster_name" {
#   description = "Name of the IAM role for EKS Cluster"
#   value       = var.aws_iam_role_eks_cluster_name
#   type        = string
# }