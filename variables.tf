# security group
variable "security_group_name" {
  description = "Name of the AWS security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the AWS security group"
  type        = string
}

variable "security_group_name_eks_cluster" {
  description = "Name of the AWS security group for eks cluster"
  type        = string
}

variable "security_group_description_eks_cluster" {
  description = "Description of the AWS security group for eks cluster"
  type        = string
}


# variable "vpc_id" {
#   description = "ID of the VPC where the security group will be created"
#   type        = string
# }

variable "port_80" {
  description = "Port for HTTP traffic (e.g., 80)"
  type        = number
}

variable "port_443" {
  description = "Port for HTTPS traffic (e.g., 443)"
  type        = number
}

variable "port_22" {
  description = "Port for SSH access (e.g., 22)"
  type        = number
}

variable "port_8080" {
  description = "Port for HTTP access for Jenkins (e.g., 8080)"
  type        = number
}

variable "port_3306" {
  description = "Port for MySQL access for RDS (e.g., 3306)"
  type        = number
}

variable "security_group_protocol" {
  description = "Protocol for the security group rules (e.g., 'tcp', 'udp', 'icmp', etc.)"
  type        = string
}

variable "web_cidr" {
  description = "CIDR block for incoming HTTP and HTTPS traffic"
  type        = string
}

variable "private_ip_address" {
  description = "CIDR block for private IP addresses (e.g., for SSH, Jenkins, MySQL)"
  type        = string
}

# alb 
# ALB for Jenkins variables
# variable "jenkins_alb_name" {
#   description = "Name of the Jenkins ALB"
#   type        = string
# }

# variable "jenkins_alb_internal" {
#   description = "Whether the Jenkins ALB is internal"
#   type        = bool
# }

# variable "load_balancer_type_alb" {
#   description = "Type of the load balancer for Jenkins ALB"
#   type        = string
# }

# variable "enable_deletion_protection" {
#   description = "Whether to enable deletion protection for Jenkins ALB"
#   type        = bool
# }

# variable "enable_http2" {
#   description = "Whether to enable HTTP/2 for Jenkins ALB"
#   type        = bool
# }

# variable "enable_cross_zone_load_balancing" {
#   description = "Whether to enable cross-zone load balancing for Jenkins ALB"
#   type        = bool
# }

# variable "alb_security_group_ids" {
#   description = "List of security group IDs for Jenkins ALB"
#   type        = list(string)
# }

# ALB Listener for Jenkins variables
variable "protocol_web" {
  description = "Protocol for Jenkins ALB Listener"
  type        = string
}

# variable "jenkins_listener_type" {
#   description = "Type of action for Jenkins ALB Listener"
#   type        = string
# }

# variable "jenkins_listener_content_type" {
#   description = "Content type for Jenkins ALB Listener"
#   type        = string
# }

# variable "jenkins_listener_status_code" {
#   description = "Status code for Jenkins ALB Listener"
#   type        = string
# }

# variable "jenkins_listener_message_body" {
#   description = "Message body for Jenkins ALB Listener"
#   type        = string
# }

# ALB for Web Servers variables
variable "web_alb_name" {
  description = "Name of the example web ALB"
  type        = string
}

variable "web_alb_internal" {
  description = "Whether the example web ALB is internal"
  type        = bool
}

variable "load_balancer_type_web" {
  description = "Type of the load balancer for example web ALB"
  type        = string
}

# ALB Target Group for Web Servers variables
variable "web_tg_name" {
  description = "Name of the example web Target Group"
  type        = string
}

# ALB Listener for Web Servers variables
variable "web_listener_type" {
  description = "Type of action for example web ALB Listener"
  type        = string
}

# rds
variable "db_parameter_group_family" {
  description = "The family of the DB parameter group."
  type        = string
  # Set your desired default family here
}


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


variable "skip_final_snapshot" {
  description = "Skip final snapshot when deleting the RDS instance"
  type        = bool
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "db_parameter_group_name" {
  description = "Name for the custom DB parameter group"
  type        = string
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


# vpc
variable "availability_zones" {
  type = list(string)
}

variable "aws_subnet_all_map_public_ip_on_launch" {
  description = "Set to true to enable auto-assign public IP address for all subnets"
  type        = bool
}

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

variable "rt_name" {
  description = "Name for the Route Table"
  type        = string
}

# Route Table Association variables
variable "rt_association" {
  description = "Name prefix for Route Table Association"
  type        = string
}

# eks

variable "aws_eks_cluster_ansible_version" {
  description = "The version of Ansible to use with AWS EKS cluster"
  type        = string
  # You can set your desired default value here
}

variable "eks_cluster_ansible_name" {
  description = "Name of the Ansible EKS cluster"
  type        = string
}

variable "aws_eks_node_group_ansible_name" {
  description = "Name of the Ansible EKS node group"
  type        = string
}

variable "aws_eks_node_group_instance_types" {
  description = "Instance types for the EKS node group"
  type        = string
}

variable "aws_eks_node_group_desired_capacity" {
  description = "Desired capacity for the EKS node group"
  type        = number
}

variable "aws_eks_node_group_min_size" {
  description = "Minimum size for the EKS node group"
  type        = number
}

variable "aws_eks_node_group_max_size" {
  description = "Maximum size for the EKS node group"
  type        = number
}

variable "aws_eks_node_group_launch_template_name_prefix" {
  description = "Name prefix for the EKS node group launch template"
  type        = string
}

variable "aws_eks_node_group_launch_template_version" {
  description = "Version for the EKS node group launch template"
  type        = string
}

variable "aws_eks_node_group_device_name" {
  description = "Device name for the EKS node group block device mappings"
  type        = string
}

variable "aws_eks_node_group_volume_size" {
  description = "Volume size for the EKS node group block device mappings"
  type        = number
}

# variable "eks_cluster_jenkins_name" {
#   description = "Name of the Jenkins EKS cluster"
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_metadata_name" {
#   description = "Name of the Jenkins Deployment metadata"
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_spec_replicas" {
#   description = "Number of replicas for the Jenkins Deployment"
#   type        = number
# }

# variable "kubernetes_deployment_jenkins_spec_selector_app" {
#   description = "App label for the Jenkins Deployment spec"
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_spec_node_affinity_key" {
#   description = "Node affinity key for Jenkins Deployment"
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_spec_node_affinity_operator" {
#   description = "Node affinity operator for Jenkins Deployment"
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_spec_containers_name" {
#   description = "Name of the Jenkins container in Deployment spec"
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_spec_containers_image" {
#   description = "Docker image for Jenkins container in Deployment spec"
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_spec_containers_ports" {
#   description = "Port for the Jenkins container in Deployment spec"
#   type        = number
# }

# variable "kubernetes_service_jenkins_master_service_metadata_name" {
#   description = "Name of the Jenkins Master Service metadata"
#   type        = string
# }

# variable "kubernetes_service_jenkins_master_service_spec_selector_app" {
#   description = "App label for the Jenkins Master Service spec"
#   type        = string
# }

# variable "kubernetes_service_jenkins_master_service_spec_type" {
#   description = "Type of the Jenkins Master Service"
#   type        = string
# }

# variable "kubernetes_config_map_jenkins_config_metadata_name" {
#   description = "Name of the Jenkins ConfigMap metadata"
#   type        = string
# }

# variable "kubernetes_config_map_jenkins_config_data" {
#   description = "Data for the Jenkins ConfigMap"
#   type        = string
# }

# variable "kubernetes_network_policy_jenkins_network_policy_metadata_name" {
#   description = "Name of the Jenkins Network Policy metadata"
#   type        = string
# }

# variable "kubernetes_network_policy_jenkins_network_policy_spec_pod_selector_app" {
#   description = "App label for the Jenkins Network Policy spec"
#   type        = string
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_metadata_name" {
#   description = "Name of the Jenkins Horizontal Pod Autoscaler metadata"
#   type        = string
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_target_average_utilization" {
#   description = "The target average utilization for the resource (e.g., CPU) that the HorizontalPodAutoscaler should maintain."
#   type        = number
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_name" {
#   description = "The name of the resource (e.g., CPU) that the HorizontalPodAutoscaler should target."
#   type        = string
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_type" {
#   description = "The type of metrics that the HorizontalPodAutoscaler should use for scaling (e.g., Resource)."
#   type        = string
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_max_relicas" {
#   description = "The maximum number of replicas that the HorizontalPodAutoscaler should scale up to."
#   type        = number
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_min_relicas" {
#   description = "The minimum number of replicas that the HorizontalPodAutoscaler should scale down to."
#   type        = number
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_api_version" {
#   description = "The API version of the target resource for scaling (e.g., 'apps/v1')."
#   type        = string
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_kind" {
#   description = "The kind of the target resource for scaling (e.g., 'Deployment', 'StatefulSet')."
#   type        = string
# }

# variable "kubernetes_network_policy_jenkins_network_policy_spec_ingress_app" {
#   description = "The label selector for matching pods in the ingress rule."
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_worker_spec_template_spec_containers_image" {
#   description = "The container image to use for Jenkins worker pods."
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_worker_spec_template_spec_containers_name" {
#   description = "The name of the container for Jenkins worker pods."
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_operator" {
#   description = "The operator for node affinity in Jenkins worker pods."
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_key" {
#   description = "The key for node affinity in Jenkins worker pods."
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_worker_spec_template_app" {
#   description = "The app label for Jenkins worker pods."
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_worker_spec_selector_app" {
#   description = "The app label for Jenkins worker pods in the deployment selector."
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_worker_spec_replicas" {
#   description = "The number of replicas for Jenkins worker pods in the deployment."
#   type        = number
# }

# variable "kubernetes_deployment_jenkins_worker_metadata_name" {
#   description = "The name for the Jenkins worker deployment metadata."
#   type        = string
# }

# variable "kubernetes_deployment_jenkins_spec_template_app" {
#   description = "The name for the Jenkins deployment spec template app."
#   type        = string
# }

# variable "kubernetes_network_policy_jenkins_network_policy_policy_types" {
#   description = "Policy types of Kubernetes network poicy of jenkins network"
#   type        = string
# }

# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metric_resource_target_type" {
#   description = "The type of resource target for the Horizontal Pod Autoscaler metric. For example, 'Utilization' or 'AverageValue'."
#   type        = string
# }

variable "aws_eks_addon_ansible_addon_name" {
  description = "Name of the AWS EKS addon for Ansible"
  type        = string
}

variable "aws_eks_addon_ansible_addon_version" {
  description = "Version of the AWS EKS addon for Ansible"
  type        = string
}


# asg
variable "key_pair_name" {
  description = "Name of the AWS Key Pair to associate with EC2 instances"
  type        = string
  # Set a default value if needed
}

variable "aws_launch_template_web_name_prefix" {
  description = "Name prefix for the AWS launch template"
  type        = string
}

variable "aws_launch_template_web_image_id" {
  description = "AMI ID for the AWS launch template"
  type        = string
}

variable "aws_launch_template_web_instance_type" {
  description = "Instance type for the AWS launch template"
  type        = string
}

variable "aws_launch_template_web_block_device_mappings_device_name" {
  description = "Device name for block device mappings in the AWS launch template"
  type        = string
}

variable "aws_launch_template_web_block_device_mappings_volume_size" {
  description = "Volume size for block device mappings in the AWS launch template"
  type        = number
}

variable "aws_launch_template_web_create_before_destroy" {
  description = "Lifecycle setting for create_before_destroy in the AWS launch template"
  type        = bool
}

variable "aws_autoscaling_group_web_desired_capacity" {
  description = "Desired capacity for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_web_max_size" {
  description = "Maximum size for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_web_min_size" {
  description = "Minimum size for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_web_launch_template_version" {
  description = "Launch template version for the AWS Auto Scaling Group"
  type        = string
}

variable "aws_autoscaling_group_web_tag_key" {
  description = "Tag key for the AWS Auto Scaling Group instances"
  type        = string
}

variable "aws_autoscaling_group_web_tag_value" {
  description = "Tag value for the AWS Auto Scaling Group instances"
  type        = string
}

variable "aws_autoscaling_group_web_tag_propagate_at_launch" {
  description = "Tag propagation setting for the AWS Auto Scaling Group instances"
  type        = bool
}

variable "aws_launch_template_ansible_name_prefix" {
  description = "Name prefix for the AWS launch template"
  type        = string
}

variable "aws_launch_template_ansible_image_id" {
  description = "AMI ID for the AWS launch template"
  type        = string
}

variable "aws_launch_template_ansible_instance_type" {
  description = "Instance type for the AWS launch template"
  type        = string
}

variable "aws_launch_template_ansible_block_device_mappings_device_name" {
  description = "Device name for block device mappings in the AWS launch template"
  type        = string
}

variable "aws_launch_template_ansible_block_device_mappings_volume_size" {
  description = "Volume size for block device mappings in the AWS launch template"
  type        = number
}

variable "aws_launch_template_ansible_create_before_destroy" {
  description = "Lifecycle setting for create_before_destroy in the AWS launch template"
  type        = bool
}

variable "aws_autoscaling_group_ansible_desired_capacity" {
  description = "Desired capacity for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_ansible_max_size" {
  description = "Maximum size for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_ansible_min_size" {
  description = "Minimum size for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_ansible_launch_template_version" {
  description = "Launch template version for the AWS Auto Scaling Group"
  type        = string
}

variable "aws_autoscaling_group_ansible_tag_key" {
  description = "Tag key for the AWS Auto Scaling Group instances"
  type        = string
}

variable "aws_autoscaling_group_ansible_tag_value" {
  description = "Tag value for the AWS Auto Scaling Group instances"
  type        = string
}

variable "aws_autoscaling_group_ansible_tag_propagate_at_launch" {
  description = "Tag propagation setting for the AWS Auto Scaling Group instances"
  type        = bool
}

# iam
variable "aws_iam_role_eks_cluster_ansible_name" {
  description = "Iam role name for esk cluster ansible"
  type        = string
}

variable "aws_iam_role_eks_nodegroup_role_ansible_name" {
  description = "Name of the IAM role associated with EKS nodegroups for Ansible"
  type        = string
  # You can set a default value if needed
  # default     = "example-role-name"
}

# anisble_userdata
variable "log_file" {
  description = "Path to the log file"
  type        = string
}

variable "aws_access_key_id" {
  description = "AWS access key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

# bastion
variable "aws_instance_eks_cluster_ansible_bastion_host_ami" {
  description = "The AMI ID for the bastion host"
  type        = string
}

variable "aws_instance_eks_cluster_ansible_bastion_host_instance_type" {
  description = "The instance type for the bastion host"
  type        = string
}

variable "aws_instance_eks_cluster_ansible_bastion_host_tags" {
  description = "Tags for the bastion host instance"
  type        = string
}

# variable "aws_instance_eks_cluster_ansible_bastion_host_provisioner_source" {
#   description = "Source path of the file to be provisioned to the bastion host"
#   type        = string
# }

variable "aws_instance_eks_cluster_ansible_bastion_host_provisioner_destination" {
  description = "Destination path on the bastion host where the file will be copied"
  type        = string
}

variable "aws_instance_eks_cluster_ansible_bastion_host_remote_exec_inline" {
  description = "Inline script to be executed on the bastion host using remote-exec provisioner"
  type        = list(string)
}
