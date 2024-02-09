module "alb" {
  source = "./modules/alb" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  # jenkins_alb_name                 = var.jenkins_alb_name
  # jenkins_alb_internal             = var.jenkins_alb_internal
  # load_balancer_type_alb           = var.load_balancer_type_alb
  # enable_deletion_protection       = var.enable_deletion_protection
  # enable_http2                     = var.enable_http2
  # enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  # alb_security_group_ids           = module.sg.security_group_id
  port_8080    = var.port_8080
  protocol_web = var.protocol_web
  # jenkins_listener_type            = var.jenkins_listener_type
  # jenkins_listener_content_type    = var.jenkins_listener_content_type
  # jenkins_listener_status_code     = var.jenkins_listener_status_code
  # jenkins_listener_message_body    = var.jenkins_listener_message_body
  web_alb_name           = var.web_alb_name
  web_alb_internal       = var.web_alb_internal
  port_80                = var.port_80
  web_listener_type      = var.web_listener_type
  web_tg_name            = var.web_tg_name
  load_balancer_type_web = var.load_balancer_type_web
  subnets                = module.vpc.subnet_ids
  security_group         = module.sg.security_group_id
  vpc_id                 = module.vpc.vpc_id
}

module "asg" {
  source = "./modules/asg" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  aws_launch_template_web_name_prefix                           = var.aws_launch_template_web_name_prefix
  aws_launch_template_web_image_id                              = var.aws_launch_template_web_image_id
  aws_launch_template_web_instance_type                         = var.aws_launch_template_web_instance_type
  aws_launch_template_web_block_device_mappings_device_name     = var.aws_launch_template_web_block_device_mappings_device_name
  aws_launch_template_web_block_device_mappings_volume_size     = var.aws_launch_template_web_block_device_mappings_volume_size
  aws_launch_template_web_create_before_destroy                 = var.aws_launch_template_web_create_before_destroy
  aws_autoscaling_group_web_desired_capacity                    = var.aws_autoscaling_group_web_desired_capacity
  aws_autoscaling_group_web_max_size                            = var.aws_autoscaling_group_web_max_size
  aws_autoscaling_group_web_min_size                            = var.aws_autoscaling_group_web_min_size
  aws_autoscaling_group_web_launch_template_version             = var.aws_autoscaling_group_web_launch_template_version
  aws_autoscaling_group_web_tag_key                             = var.aws_autoscaling_group_web_tag_key
  aws_autoscaling_group_web_tag_value                           = var.aws_autoscaling_group_web_tag_value
  aws_autoscaling_group_web_tag_propagate_at_launch             = var.aws_autoscaling_group_web_tag_propagate_at_launch
  aws_launch_template_web_user_data                             = "${path.module}/web_userdata.sh"
  aws_autoscaling_group_web_vpc_zone_identifier                 = module.vpc.subnet_ids
  key_pair_name                                                 = var.key_pair_name
  aws_launch_template_web_network_interfaces_security_groups    = module.sg.security_group_ids
  aws_launch_template_ansible_vpc_security_group_ids            = module.sg.security_group_ids
  aws_launch_template_ansible_name_prefix                       = var.aws_launch_template_ansible_name_prefix
  aws_launch_template_ansible_image_id                          = var.aws_launch_template_ansible_image_id
  aws_launch_template_ansible_instance_type                     = var.aws_launch_template_ansible_instance_type
  aws_launch_template_ansible_block_device_mappings_device_name = var.aws_launch_template_ansible_block_device_mappings_device_name
  aws_launch_template_ansible_block_device_mappings_volume_size = var.aws_launch_template_ansible_block_device_mappings_volume_size
  aws_launch_template_ansible_create_before_destroy             = var.aws_launch_template_ansible_create_before_destroy
  aws_autoscaling_group_ansible_desired_capacity                = var.aws_autoscaling_group_ansible_desired_capacity
  aws_autoscaling_group_ansible_max_size                        = var.aws_autoscaling_group_ansible_max_size
  aws_autoscaling_group_ansible_min_size                        = var.aws_autoscaling_group_ansible_min_size
  aws_autoscaling_group_ansible_launch_template_version         = var.aws_autoscaling_group_ansible_launch_template_version
  aws_autoscaling_group_ansible_tag_key                         = var.aws_autoscaling_group_ansible_tag_key
  aws_autoscaling_group_ansible_tag_value                       = var.aws_autoscaling_group_ansible_tag_value
  aws_autoscaling_group_ansible_tag_propagate_at_launch         = var.aws_autoscaling_group_ansible_tag_propagate_at_launch
  # aws_launch_template_ansible_user_data                          = data.template_file.ansible_userdata.rendered
  aws_autoscaling_group_ansible_vpc_zone_identifier              = module.vpc.subnet_ids
  aws_launch_template_ansible_network_interfaces_security_groups = module.sg.security_group_ids
  aws_access_key_id                                              = var.aws_access_key_id
  log_file                                                       = var.log_file
  aws_secret_access_key                                          = var.aws_secret_access_key
  aws_region                                                     = var.aws_region
  eks_cluster_ansible_name                                       = var.eks_cluster_ansible_name
  aws_eks_node_group_instance_types                              = var.aws_eks_node_group_instance_types
  # kubernetes_network_policy_jenkins_network_policy_spec_ingress_app = var.kubernetes_network_policy_jenkins_network_policy_spec_ingress_app
  aws_eks_cluster_ansible_version = var.aws_eks_cluster_ansible_version
}

module "eks" {
  source = "./modules/eks" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  eks_cluster_ansible_name                       = var.eks_cluster_ansible_name
  aws_eks_node_group_ansible_name                = var.aws_eks_node_group_ansible_name
  aws_eks_node_group_instance_types              = var.aws_eks_node_group_instance_types
  aws_eks_node_group_desired_capacity            = var.aws_eks_node_group_desired_capacity
  aws_eks_node_group_min_size                    = var.aws_eks_node_group_min_size
  aws_eks_node_group_max_size                    = var.aws_eks_node_group_max_size
  aws_eks_node_group_launch_template_name_prefix = module.asg.launch_template_id
  aws_eks_node_group_launch_template_version     = var.aws_eks_node_group_launch_template_version
  aws_eks_node_group_device_name                 = var.aws_eks_node_group_device_name
  aws_eks_node_group_volume_size                 = var.aws_eks_node_group_volume_size
  # eks_cluster_jenkins_name                                                                          = var.eks_cluster_jenkins_name
  # kubernetes_deployment_jenkins_metadata_name                                                       = var.kubernetes_deployment_jenkins_metadata_name
  # kubernetes_deployment_jenkins_spec_replicas                                                       = var.kubernetes_deployment_jenkins_spec_replicas
  # kubernetes_deployment_jenkins_spec_selector_app                                                   = var.kubernetes_deployment_jenkins_spec_selector_app
  # kubernetes_deployment_jenkins_spec_template_app                                                   = var.kubernetes_deployment_jenkins_spec_template_app
  # kubernetes_deployment_jenkins_spec_node_affinity_key                                              = var.kubernetes_deployment_jenkins_spec_node_affinity_key
  # kubernetes_deployment_jenkins_spec_node_affinity_operator                                         = var.kubernetes_deployment_jenkins_spec_node_affinity_operator
  # kubernetes_deployment_jenkins_spec_containers_name                                                = var.kubernetes_deployment_jenkins_spec_containers_name
  # kubernetes_deployment_jenkins_spec_containers_image                                               = var.kubernetes_deployment_jenkins_spec_containers_image
  # kubernetes_deployment_jenkins_spec_containers_ports                                               = var.kubernetes_deployment_jenkins_spec_containers_ports
  # kubernetes_deployment_jenkins_worker_metadata_name                                                = var.kubernetes_deployment_jenkins_worker_metadata_name
  # kubernetes_deployment_jenkins_worker_spec_replicas                                                = var.kubernetes_deployment_jenkins_worker_spec_replicas
  # kubernetes_deployment_jenkins_worker_spec_selector_app                                            = var.kubernetes_deployment_jenkins_worker_spec_selector_app
  # kubernetes_deployment_jenkins_worker_spec_template_app                                            = var.kubernetes_deployment_jenkins_worker_spec_template_app
  # kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_key                         = var.kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_key
  # kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_operator                    = var.kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_operator
  # kubernetes_deployment_jenkins_worker_spec_template_spec_containers_name                           = var.kubernetes_deployment_jenkins_worker_spec_template_spec_containers_name
  # kubernetes_deployment_jenkins_worker_spec_template_spec_containers_image                          = var.kubernetes_deployment_jenkins_worker_spec_template_spec_containers_image
  # kubernetes_service_jenkins_master_service_metadata_name                                           = var.kubernetes_service_jenkins_master_service_metadata_name
  # kubernetes_service_jenkins_master_service_spec_selector_app                                       = var.kubernetes_service_jenkins_master_service_spec_selector_app
  # port_80                                                                                           = var.port_80
  # port_8080                                                                                         = var.port_8080
  # kubernetes_config_map_jenkins_config_metadata_name                                                = var.kubernetes_config_map_jenkins_config_metadata_name
  # kubernetes_config_map_jenkins_config_data                                                         = var.kubernetes_config_map_jenkins_config_data
  # kubernetes_network_policy_jenkins_network_policy_metadata_name                                    = var.kubernetes_network_policy_jenkins_network_policy_metadata_name
  # kubernetes_network_policy_jenkins_network_policy_spec_pod_selector_app                            = var.kubernetes_network_policy_jenkins_network_policy_spec_pod_selector_app
  # kubernetes_network_policy_jenkins_network_policy_spec_ingress_app                                 = var.kubernetes_network_policy_jenkins_network_policy_spec_ingress_app
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_metadata_name                                    = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_metadata_name
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_kind                       = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_kind
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_api_version                = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_api_version
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_min_relicas                                 = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_min_relicas
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_max_relicas                                 = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_max_relicas
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_type                                = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_type
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_name                       = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_name
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_target_average_utilization = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_target_average_utilization
  # kubernetes_service_jenkins_master_service_spec_type                                               = var.kubernetes_service_jenkins_master_service_spec_type
  subnets = module.vpc.subnet_ids
  # kubernetes_network_policy_jenkins_network_policy_policy_types                                     = var.kubernetes_network_policy_jenkins_network_policy_policy_types
  # kubernetes_service_jenkins_master_service_load_balancer_ip                                        = module.alb.jenkins_alb_dns_name
  aws_eks_cluster_ansible_role_arn = module.iam.eks_ansible_cluster_iam_role_arn
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metric_resource_target_type                 = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metric_resource_target_type
  aws_eks_node_group_ansible_role_arn                                   = module.iam.eks_ansible_nodegroup_iam_role_arn
  ec2_ssh_key                                                           = "${path.module}/web-ec2.pem"
  eks_worker_node_policy_attachment_ansible                             = module.iam.eks_worker_node_policy_attachment_ansible
  eks_cni_policy_attachment_ansible                                     = module.iam.eks_cni_policy_attachment_ansible
  eks_ec2_container_registry_readonly_attachment_ansible                = module.iam.eks_ec2_container_registry_readonly_attachment_ansible
  aws_eks_node_group_launch_template_name_prefix_ansible                = module.asg.launch_template_id_ansible
  aws_eks_addon_ansible_addon_name                                      = var.aws_eks_addon_ansible_addon_name
  aws_eks_addon_ansible_addon_version                                   = var.aws_eks_addon_ansible_addon_version
  aws_eks_cluster_ansible_security_group_ids                            = module.sg.security_group_id_eks_cluster
  aws_eks_cluster_ansible_version                                       = var.aws_eks_cluster_ansible_version
  aws_instance_eks_cluster_ansible_bastion_host_ami                     = var.aws_instance_eks_cluster_ansible_bastion_host_ami
  aws_instance_eks_cluster_ansible_bastion_host_instance_type           = var.aws_instance_eks_cluster_ansible_bastion_host_instance_type
  key_pair_name                                                         = var.key_pair_name
  aws_instance_eks_cluster_ansible_bastion_host_subnet_id               = module.vpc.public_subnet
  aws_instance_eks_cluster_ansible_bastion_host_security_groups         = module.sg.security_group_ids
  aws_instance_eks_cluster_ansible_bastion_host_tags                    = var.aws_instance_eks_cluster_ansible_bastion_host_tags
  aws_instance_eks_cluster_ansible_bastion_host_provisioner_destination = var.aws_instance_eks_cluster_ansible_bastion_host_provisioner_destination
  aws_instance_eks_cluster_ansible_bastion_host_provisioner_source      = "${path.module}/web-ec2.pem"
  aws_instance_eks_cluster_ansible_bastion_host_remote_exec_inline      = var.aws_instance_eks_cluster_ansible_bastion_host_remote_exec_inline

}

module "iam" {
  source = "./modules/iam" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  aws_iam_role_eks_cluster_ansible_name               = var.aws_iam_role_eks_cluster_ansible_name
  aws_iam_role_eks_cluster_assume_role_policy_ansible = file("assume_role_policy.json")
  aws_iam_role_eks_nodegroup_role_ansible_name        = var.aws_iam_role_eks_nodegroup_role_ansible_name
}

module "rds" {
  source = "./modules/rds" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  db_allocated_storage      = var.db_allocated_storage
  db_storage_type           = var.db_storage_type
  db_engine                 = var.db_engine
  db_engine_version         = var.db_engine_version
  db_instance_class         = var.db_instance_class
  db_name                   = var.db_name
  db_username               = var.db_username
  db_password               = var.db_password
  db_parameter_group_name   = var.db_parameter_group_name
  skip_final_snapshot       = var.skip_final_snapshot
  db_subnet_group_name      = var.db_subnet_group_name
  subnets                   = module.vpc.subnet_ids
  security_group            = module.sg.security_group_id
  db_parameter_group_family = var.db_parameter_group_family
  db_parameter_server_name  = var.db_parameter_server_name
  db_parameter_client_name  = var.db_parameter_client_name
  character_set_server      = var.character_set_server
  character_set_client      = var.character_set_client

}

module "sg" {
  source = "./modules/sg" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  security_group_name                    = var.security_group_name
  security_group_description             = var.security_group_description
  security_group_name_eks_cluster        = var.security_group_name_eks_cluster
  security_group_description_eks_cluster = var.security_group_description_eks_cluster
  vpc_id                                 = module.vpc.vpc_id
  port_80                                = var.port_80
  port_443                               = var.port_443
  port_22                                = var.port_22
  port_8080                              = var.port_8080
  port_3306                              = var.port_3306
  security_group_protocol                = var.security_group_protocol
  web_cidr                               = var.web_cidr
  private_ip_address                     = var.private_ip_address
  vpc_cidr_block                         = var.vpc_cidr_block
}

module "vpc" {
  source = "./modules/vpc" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  vpc_cidr_block                         = var.vpc_cidr_block
  vpc_name                               = var.vpc_name
  public_subnet_cidr_blocks              = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks             = var.private_subnet_cidr_blocks
  subnet                                 = var.subnet
  igw_name                               = var.igw_name
  web_cidr                               = var.web_cidr
  rt_name                                = var.rt_name
  rt_association                         = var.rt_association
  availability_zones                     = var.availability_zones
  aws_subnet_all_map_public_ip_on_launch = var.aws_subnet_all_map_public_ip_on_launch
}



