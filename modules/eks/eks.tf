# esk ansible
resource "aws_eks_cluster" "ansible" {
  name     = var.eks_cluster_ansible_name # "ansible-cluster"
  role_arn = var.aws_eks_cluster_ansible_role_arn

  vpc_config {
    subnet_ids = var.subnets # Replace with your subnet IDs
    security_group_ids = [var.aws_eks_cluster_ansible_security_group_ids]
  }

  version = var.aws_eks_cluster_ansible_version
}

resource "aws_eks_node_group" "ansible" {
  cluster_name    = aws_eks_cluster.ansible.name
  node_group_name = var.aws_eks_node_group_ansible_name # "ansible-node-group"
  node_role_arn   = var.aws_eks_node_group_ansible_role_arn
  subnet_ids      = var.subnets # Replace with your subnet IDs
  # instance_types  = [var.aws_eks_node_group_instance_types] # ["t2.micro"]
  scaling_config {
    desired_size = var.aws_eks_node_group_desired_capacity # 2
    min_size        = var.aws_eks_node_group_min_size # 1
    max_size        = var.aws_eks_node_group_max_size # 3
  }
  launch_template {
    id = var.aws_eks_node_group_launch_template_name_prefix_ansible # "id"
    version     = var.aws_eks_node_group_launch_template_version # "$Latest"

    # block_device_mappings {
    #   device_name = var.aws_eks_node_group_device_name # "xvda"
    #   ebs {
    #     volume_size = var.aws_eks_node_group_volume_size # 20
    #   }
    # }

    # data_source_id = aws_eks_cluster.ansible.id
    # user_data = file("${path.module}/../ansible_userdata.sh")
  }
  # remote_access {
  #   ec2_ssh_key = var.ec2_ssh_key
  # }

  depends_on = [
    var.eks_worker_node_policy_attachment_ansible,
    var.eks_cni_policy_attachment_ansible,
    var.eks_ec2_container_registry_readonly_attachment_ansible,
  ]
}

resource "aws_eks_addon" "ansible" {
  cluster_name                = aws_eks_cluster.ansible.name
  addon_name                  = var.aws_eks_addon_ansible_addon_name # "vpc-cni"
  addon_version               = var.aws_eks_addon_ansible_addon_version # "v1.16.2-eksbuild.1" #e.g., previous version v1.9.3-eksbuild.3 and the new version is v1.10.1-eksbuild.1
}

# # eks jenkins
# # Create the Jenkins Cluster (EKS)
# resource "aws_eks_cluster" "jenkins_cluster" {
#   name     = var.eks_cluster_jenkins_name # "jenkins-cluster"
#   role_arn = var.aws_eks_cluster_ansible_role_arn

#   vpc_config {
#     subnet_ids = var.subnets
#     # Add other VPC configurations as needed
#   }

#   # Add other EKS cluster configurations as needed
# }

# # Define Kubernetes resources for Jenkins (Deployment, Service, ConfigMap, etc.)
# # Example Deployment for Jenkins Master
# resource "kubernetes_deployment" "jenkins_master" {
#   metadata {
#     name = var.kubernetes_deployment_jenkins_metadata_name # "jenkins-master"
#   }

#   spec {
#     replicas = var.kubernetes_deployment_jenkins_spec_replicas # 1

#     selector {
#       match_labels = {
#         app = var.kubernetes_deployment_jenkins_spec_selector_app # "jenkins-master"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = var.kubernetes_deployment_jenkins_spec_template_app # "jenkins-master"
#         }
#       }

#       spec {
#         affinity {
#           node_affinity {
#               required_during_scheduling_ignored_during_execution {
#                 node_selector_term {
#                   match_expressions {
#                     key      = var.kubernetes_deployment_jenkins_spec_node_affinity_key # "node-role.kubernetes.io/master"
#                     operator = var.kubernetes_deployment_jenkins_spec_node_affinity_operator # "Exists"
#                   }
#                 }
#               }
#           }
#         }

#         container {
#           name  = var.kubernetes_deployment_jenkins_spec_containers_name # "jenkins-master"
#           image = var.kubernetes_deployment_jenkins_spec_containers_image # "jenkins/jenkins:lts"
#           port {
#             container_port = var.kubernetes_deployment_jenkins_spec_containers_ports # 8080
#           }
#         }
#       }
#     }
#   }
# }

# # Example Deployment for Jenkins Worker
# resource "kubernetes_deployment" "jenkins_worker" {
#   metadata {
#     name = var.kubernetes_deployment_jenkins_worker_metadata_name # "jenkins-worker"
#   }

#   spec {
#     replicas = var.kubernetes_deployment_jenkins_worker_spec_replicas # 2 # Adjust as needed

#     selector {
#       match_labels = {
#         app = var.kubernetes_deployment_jenkins_worker_spec_selector_app # "jenkins-worker"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = var.kubernetes_deployment_jenkins_worker_spec_template_app # "jenkins-worker"
#         }
#       }

#       spec {
#         affinity {
#           node_affinity {
#             required_during_scheduling_ignored_during_execution {
#               node_selector_term {
#                 match_expressions {
#                   key      = var.kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_key # "node-role.kubernetes.io/worker"
#                   operator = var.kubernetes_deployment_jenkins_worker_spec_template_spec_node_affinity_operator # "Exists"
#                 }
#               }
#             }
#           }
#         }

#         container {
#           name  = var.kubernetes_deployment_jenkins_worker_spec_template_spec_containers_name # "jenkins-worker"
#           image = var.kubernetes_deployment_jenkins_worker_spec_template_spec_containers_image # "jenkins/jenkins-agent"
#           # Add other Jenkins worker container configurations as needed
#         }
#       }
#     }
#   }
# }

# # Example Service to expose Jenkins Master
# resource "kubernetes_service" "jenkins_master_service" {
#   metadata {
#     name = var.kubernetes_service_jenkins_master_service_metadata_name # "jenkins-master-service"
#   }

#   spec {
#     selector = {
#       app = var.kubernetes_service_jenkins_master_service_spec_selector_app # "jenkins-master"
#     }

#     port {
#       port        = var.port_80 # 80
#       target_port = var.port_8080 # 8080
#     }

#     type = var.kubernetes_service_jenkins_master_service_spec_type # "LoadBalancer"
#     # load_balancer_ip = var.kubernetes_service_jenkins_master_service_load_balancer_ip
#   }
# }

# # Jenkins Configuration (configure Jenkins within Kubernetes)

# # Example Jenkins ConfigMap to configure Jenkins
# resource "kubernetes_config_map" "jenkins_config" {
#   metadata {
#     name = var.kubernetes_config_map_jenkins_config_metadata_name # "jenkins-config"
#   }

#   data = {
#     "JENKINS_URL" = var.kubernetes_config_map_jenkins_config_data # "http://jenkins-master-service:8080" # Update with the actual Jenkins URL
#     # Add other Jenkins configuration as needed
#   }
# }

# # Implement access control policies to secure communication between Jenkins components

# # Example Network Policy to control ingress traffic to Jenkins
# resource "kubernetes_network_policy" "jenkins_network_policy" {
#   metadata {
#     name = var.kubernetes_network_policy_jenkins_network_policy_metadata_name # "jenkins-network-policy"
#   }

#   spec {
#     pod_selector {
#       match_labels = {
#         app = var.kubernetes_network_policy_jenkins_network_policy_spec_pod_selector_app # "jenkins-master"
#       }
#     }

#     ingress {
#       from {
#         pod_selector {
#           match_labels = {
#             app = var.kubernetes_network_policy_jenkins_network_policy_spec_ingress_app # "jenkins-worker"
#           }
#         }
#       }
#     }
#     policy_types = [var.kubernetes_network_policy_jenkins_network_policy_policy_types] # ["Ingress", "Egress"]
#   }
# }

# # Scaling and Management (independently scale and manage Jenkins as needed)

# # Example HorizontalPodAutoscaler to automatically scale Jenkins pods
# resource "kubernetes_horizontal_pod_autoscaler" "jenkins_hpa" {
#   metadata {
#     name = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_metadata_name # "jenkins-hpa"
#   }

#   spec {
#     scale_target_ref {
#       kind            = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_kind # "Deployment"
#       name            = kubernetes_deployment.jenkins_master.metadata[0].name
#       api_version     = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_sacle_target_ref_api_version # "apps/v1"
#     }

#     min_replicas = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_min_relicas # 1
#     max_replicas = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_max_relicas # 5 # Adjust based on your scaling requirements

#     metric {
#       type = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_type # "Resource"

#       resource {
#         name = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_name  # "cpu"
#         target {
#           type = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metric_resource_target_type # "Utilization"
#           average_utilization = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metrics_resource_target_average_utilization # 80 # Adjust as needed
#         }
#       }
#     }
#   }
# }


# # resource "kubectl_config_map" "aws_auth" {
# #   config_map {
# #     name      = "aws-auth"
# #     namespace = "kube-system"
# #     data      = file("${path.module}/aws-auth.yaml")  # Path to the aws-auth.yaml file
# #   }
# # }
