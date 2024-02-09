# security group
security_group_name                    = "all"
security_group_description             = "security group for all"
security_group_name_eks_cluster        = "eks_cluster"
security_group_description_eks_cluster = "security group for eks cluster"
port_80                                = 80
port_443                               = 443
port_22                                = 22
port_8080                              = 8080
port_3306                              = 3306
security_group_protocol                = "tcp"
web_cidr                               = "0.0.0.0/0"
private_ip_address                     = "142.181.133.138/32"

# alb 
# # ALB for Jenkins variables
# jenkins_alb_name                 = "jenkins-alb"
# jenkins_alb_internal             = false
# load_balancer_type_alb           = "application"
# enable_deletion_protection       = false
# enable_http2                     = true
# enable_cross_zone_load_balancing = true

# # ALB Listener for Jenkins variables
protocol_web = "HTTP"
# jenkins_listener_type         = "fixed-response"
# jenkins_listener_content_type = "text/plain"
# jenkins_listener_status_code  = "200"
# jenkins_listener_message_body = "OK"

# ALB for Web Servers variables
web_alb_name           = "web-alb"
web_alb_internal       = false
load_balancer_type_web = "application"

# ALB Target Group for Web Servers variables
web_tg_name = "web-target-group"

# ALB Listener for Web Servers variables
web_listener_type = "forward"

# rds
# RDS Database variables
db_allocated_storage      = 20
db_storage_type           = "gp2"
db_engine                 = "mysql"
db_engine_version         = "5.7"
db_instance_class         = "db.t2.micro"
db_name                   = "terraformed_rds"
db_username               = "rds"
db_password               = "terraformed!"
db_parameter_group_name   = "rds-parameter-group"
skip_final_snapshot       = true
db_subnet_group_name      = "rds-subnet-group"
subnet                    = "subnet"
db_parameter_group_family = "mysql5.7"
db_parameter_server_name  = "character_set_server"
db_parameter_client_name  = "character_set_client"
character_set_server      = "swe7"
character_set_client      = "latin1"


# vpc
# VPC variables
vpc_cidr_block                         = "10.0.0.0/16"
vpc_name                               = "vpc"
public_subnet_cidr_blocks              = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr_blocks             = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
availability_zones                     = ["us-east-1a", "us-east-1b", "us-east-1c"]
aws_subnet_all_map_public_ip_on_launch = true


# Internet Gateway variables
igw_name = "igw"

# Route Table variables
rt_name = "route-table"

# Route Table Association variables
rt_association = "rt-association"

# eks
eks_cluster_ansible_name                       = "eks-cluster"
aws_eks_node_group_ansible_name                = "eks-node-group"
aws_eks_node_group_instance_types              = "t2.micro"
aws_eks_node_group_desired_capacity            = 2
aws_eks_node_group_min_size                    = 1
aws_eks_node_group_max_size                    = 3
aws_eks_node_group_launch_template_name_prefix = "ansible"
aws_eks_node_group_launch_template_version     = "$Latest"
aws_eks_node_group_device_name                 = "xvda"
aws_eks_node_group_volume_size                 = 20
# eks_cluster_jenkins_name                                                                          = "jenkins-cluster"
# kubernetes_deployment_jenkins_metadata_name                                                       = "jenkins-deployment"
# kubernetes_deployment_jenkins_spec_replicas                                                       = 1
# kubernetes_deployment_jenkins_spec_selector_app                                                   = "jenkins-master"
# kubernetes_deployment_jenkins_spec_node_affinity_key                                              = "node-role.kubernetes.io/master"
# kubernetes_deployment_jenkins_spec_node_affinity_operator                                         = "Exists"
# kubernetes_deployment_jenkins_spec_containers_name                                                = "jenkins-master"
# kubernetes_deployment_jenkins_spec_containers_image                                               = "jenkins/jenkins:lts"
# kubernetes_deployment_jenkins_spec_containers_ports                                               = 8080
# kubernetes_service_jenkins_master_service_metadata_name                                           = "jenkins-master-service"
# kubernetes_service_jenkins_master_service_spec_selector_app                                       = "jenkins-master"
# kubernetes_service_jenkins_master_service_spec_type                                               = "LoadBalancer"
# kubernetes_config_map_jenkins_config_metadata_name                                                = "jenkins-config"
# kubernetes_config_map_jenkins_config_data                                                         = "http://jenkins-master-service:8080"
# kubernetes_network_policy_jenkins_network_policy_metadata_name                                    = "jenkins-network-policy"
# kubernetes_network_policy_jenkins_network_policy_spec_pod_selector_app                            = "jenkins-master"
# kubernetes_network_policy_jenkins_network_policy_policy_types                                     = "Ingress,Egress"
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_target_average_utilization = 80
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metric_resource_target_type                 = "Utilization"
# kubernetes_deployment_jenkins_spec_template_app                                                   = "jenkins-master"
# kubernetes_deployment_jenkins_worker_metadata_name                                                = "jenkins-worker"
# kubernetes_deployment_jenkins_worker_spec_replicas                                                = 2
# kubernetes_deployment_jenkins_worker_spec_selector_app                                            = "jenkins-worker"
# kubernetes_deployment_jenkins_worker_spec_template_app                                            = "jenkins-worker"
# kubernetes_deployment_jenkins_worker_spec_template_spec_containers_image                          = "jenkins/jenkins-agent"
# kubernetes_deployment_jenkins_worker_spec_template_spec_containers_name                           = "jenkins-worker"
# kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_key                         = "node-role.kubernetes.io/worker"
# kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_operator                    = "Exists"
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_metadata_name                                    = "jenkins-hpa"
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_max_relicas                                 = 5
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_name                       = "cpu"
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_type                                = "Resource"
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_min_relicas                                 = 1
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_api_version                = "apps/v1"
# kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_kind                       = "Deployment"
# kubernetes_network_policy_jenkins_network_policy_spec_ingress_app                                 = "jenkins-worker"
aws_eks_cluster_ansible_version     = "1.29"
aws_eks_addon_ansible_addon_name    = "vpc-cni"
aws_eks_addon_ansible_addon_version = "v1.16.2-eksbuild.1"

# asg
aws_launch_template_web_name_prefix                           = "web-launch-template"
aws_launch_template_web_image_id                              = "ami-075e152940664b7b2"
aws_launch_template_web_instance_type                         = "t2.micro"
aws_launch_template_web_block_device_mappings_device_name     = "xvdb"
aws_launch_template_web_block_device_mappings_volume_size     = 20
aws_launch_template_web_create_before_destroy                 = true
aws_autoscaling_group_web_desired_capacity                    = 2
aws_autoscaling_group_web_max_size                            = 4
aws_autoscaling_group_web_min_size                            = 1
aws_autoscaling_group_web_launch_template_version             = "$Latest"
aws_autoscaling_group_web_tag_key                             = "Environment"
aws_autoscaling_group_web_tag_value                           = "Dev"
aws_autoscaling_group_web_tag_propagate_at_launch             = true
key_pair_name                                                 = "web-ec2"
aws_launch_template_ansible_name_prefix                       = "ansible-launch-template"
aws_launch_template_ansible_image_id                          = "ami-075e152940664b7b2"
aws_launch_template_ansible_instance_type                     = "t2.micro"
aws_launch_template_ansible_block_device_mappings_device_name = "xvdc"
aws_launch_template_ansible_block_device_mappings_volume_size = 20
aws_launch_template_ansible_create_before_destroy             = true
aws_autoscaling_group_ansible_desired_capacity                = 2
aws_autoscaling_group_ansible_max_size                        = 4
aws_autoscaling_group_ansible_min_size                        = 1
aws_autoscaling_group_ansible_launch_template_version         = "$Latest"
aws_autoscaling_group_ansible_tag_key                         = "Environment"
aws_autoscaling_group_ansible_tag_value                       = "Dev"
aws_autoscaling_group_ansible_tag_propagate_at_launch         = true


#iam
aws_iam_role_eks_cluster_ansible_name        = "ansible-cluster-role"
aws_iam_role_eks_nodegroup_role_ansible_name = "ansible-nodegroup-role"


# ansbile_userdata
log_file              = "/var/log/userdata.log"
aws_access_key_id     = "AKIA53CSBY6XJM5R2AVT"
aws_secret_access_key = "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"
aws_region            = "us-east-1"


# bastion
aws_instance_eks_cluster_ansible_bastion_host_ami                     = "ami-0e731c8a588258d0d"
aws_instance_eks_cluster_ansible_bastion_host_instance_type           = "t2.micro"
aws_instance_eks_cluster_ansible_bastion_host_tags                    = "bastion-host"
aws_instance_eks_cluster_ansible_bastion_host_provisioner_destination = "/home/ec2-user/web-ec2.pem"
aws_instance_eks_cluster_ansible_bastion_host_remote_exec_inline      = ["sudo chmod 400 /home/ec2-user/web-ec2.pem"]