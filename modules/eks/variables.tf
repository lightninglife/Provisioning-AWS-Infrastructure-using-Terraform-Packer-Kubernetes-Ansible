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

# variable "port_8080" {
#   description = "Port for HTTP access for Jenkins (e.g., 8080)"
#   type        = number
# }

# variable "port_80" {
#   description = "Port for HTTP traffic (e.g., 80)"
#   type        = number
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

variable "subnets" {
  description = "subnets"
  type        = list(string)
}

# variable "kubernetes_network_policy_jenkins_network_policy_policy_types" {
#   description = "Policy types of Kubernetes network poicy of jenkins network"
#   type        = string
# }

# variable "kubernetes_service_jenkins_master_service_load_balancer_ip" {
#   description = "Kubernetes service jenkins master load balancer ip"
#   type        = string
# }

variable "aws_eks_cluster_ansible_role_arn" {
  description = "EKS Cluster for Ansible's role arn"
  type        = string
}

variable "aws_eks_node_group_ansible_role_arn" {
  description = "EKS node group for Ansible's role arn"
  type        = string
}


# variable "kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metric_resource_target_type" {
#   description = "The type of resource target for the Horizontal Pod Autoscaler metric. For example, 'Utilization' or 'AverageValue'."
#   type        = string
# }

variable "aws_eks_cluster_ansible_version" {
  description = "The version of Ansible to use with AWS EKS cluster"
  type        = string
   # You can set your desired default value here
}

variable "ec2_ssh_key" {
  description = "Name of the EC2 SSH key pair"
  type        = string
  # You can set a default value if needed
  # default     = "example-key-pair-name"
}

variable "eks_worker_node_policy_attachment_ansible" {
  description = "IAM policy attachment name for worker nodes in Ansible EKS setup"
  type        = string
}

variable "eks_cni_policy_attachment_ansible" {
  description = "IAM policy attachment name for CNI (Container Network Interface) in Ansible EKS setup"
  type        = string
}

variable "eks_ec2_container_registry_readonly_attachment_ansible" {
  description = "IAM policy attachment name for read-only access to the EC2 container registry in Ansible EKS setup"
  type        = string
}

variable "aws_eks_node_group_launch_template_name_prefix_ansible" {
  description = "Prefix for the name of the AWS EKS Node Group launch template in Ansible setup"
  type        = string
  # You can provide a default prefix if needed
}

variable "aws_eks_addon_ansible_addon_name" {
  description = "Name of the AWS EKS addon for Ansible"
  type        = string
}

variable "aws_eks_addon_ansible_addon_version" {
  description = "Version of the AWS EKS addon for Ansible"
  type        = string
}

variable "aws_eks_cluster_ansible_security_group_ids" {
  description = "Security group IDs for the EKS cluster used by Ansible"
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

variable "key_pair_name" {
  description = "The name of the AWS key pair used to access the bastion host"
  type        = string
}

variable "aws_instance_eks_cluster_ansible_bastion_host_subnet_id" {
  description = "The ID of the subnet where the bastion host will be launched"
  type        = string
}

variable "aws_instance_eks_cluster_ansible_bastion_host_security_groups" {
  description = "The ID of the security group(s) for the bastion host"
  type        = list(string)
}

variable "aws_instance_eks_cluster_ansible_bastion_host_tags" {
  description = "Tags for the bastion host instance"
  type        = string
}

variable "aws_instance_eks_cluster_ansible_bastion_host_provisioner_source" {
  description = "Source path of the file to be provisioned to the bastion host"
  type        = string
}

variable "aws_instance_eks_cluster_ansible_bastion_host_provisioner_destination" {
  description = "Destination path on the bastion host where the file will be copied"
  type        = string
}

variable "aws_instance_eks_cluster_ansible_bastion_host_remote_exec_inline" {
  description = "Inline script to be executed on the bastion host using remote-exec provisioner"
  type        = list(string)
}
