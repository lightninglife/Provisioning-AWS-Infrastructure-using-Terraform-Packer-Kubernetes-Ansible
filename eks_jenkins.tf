# Define your AWS provider configuration
provider "aws" {
  region = "us-west-2" # Change to your desired region
}

# Create a VPC for Jenkins Cluster
resource "aws_vpc" "jenkins_vpc" {
  cidr_block = "10.0.0.0/16"
  # Add other VPC configurations as needed
}

# Create subnets for Jenkins Cluster
resource "aws_subnet" "jenkins_subnets" {
  count = 2
  vpc_id = aws_vpc.jenkins_vpc.id
  cidr_block = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)
  # Add other subnet configurations as needed
}

# Create the Jenkins Cluster (EKS)
resource "aws_eks_cluster" "jenkins_cluster" {
  name     = "jenkins-cluster"
  role_arn = aws_iam_role.jenkins_cluster_role.arn

  vpc_config {
    subnet_ids = aws_subnet.jenkins_subnets[*].id
    # Add other VPC configurations as needed
  }

  # Add other EKS cluster configurations as needed
}

# Define Kubernetes resources for Jenkins (Deployment, Service, ConfigMap, etc.)
# Example Deployment for Jenkins Master
resource "kubernetes_deployment" "jenkins_master" {
  metadata {
    name = "jenkins-master"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "jenkins-master"
      }
    }

    template {
      metadata {
        labels = {
          app = "jenkins-master"
        }
      }

      spec {
        affinity {
          node_affinity {
            required {
              node_selector_terms {
                match_expressions {
                  key      = "node-role.kubernetes.io/master"
                  operator = "Exists"
                }
              }
            }
          }
        }

        containers {
          name  = "jenkins-master"
          image = "jenkins/jenkins:lts"
          ports {
            container_port = 8080
          }
        }
      }
    }
  }
}

# Example Deployment for Jenkins Worker
resource "kubernetes_deployment" "jenkins_worker" {
  metadata {
    name = "jenkins-worker"
  }

  spec {
    replicas = 2 # Adjust as needed

    selector {
      match_labels = {
        app = "jenkins-worker"
      }
    }

    template {
      metadata {
        labels = {
          app = "jenkins-worker"
        }
      }

      spec {
        affinity {
          node_affinity {
            required {
              node_selector_terms {
                match_expressions {
                  key      = "node-role.kubernetes.io/worker"
                  operator = "Exists"
                }
              }
            }
          }
        }

        containers {
          name  = "jenkins-worker"
          image = "jenkins/jenkins-agent"
          # Add other Jenkins worker container configurations as needed
        }
      }
    }
  }
}

# Example Service to expose Jenkins Master
resource "kubernetes_service" "jenkins_master_service" {
  metadata {
    name = "jenkins-master-service"
  }

  spec {
    selector = {
      app = "jenkins-master"
    }

    ports {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
    load_balancer_ip = aws_lb.jenkins_alb.dns_name
  }
}

# Jenkins Configuration (configure Jenkins within Kubernetes)

# Example Jenkins ConfigMap to configure Jenkins
resource "kubernetes_config_map" "jenkins_config" {
  metadata {
    name = "jenkins-config"
  }

  data = {
    "JENKINS_URL" = "http://jenkins-master-service:8080" # Update with the actual Jenkins URL
    # Add other Jenkins configuration as needed
  }
}

# Implement access control policies to secure communication between Jenkins components

# Example Network Policy to control ingress traffic to Jenkins
resource "kubernetes_network_policy" "jenkins_network_policy" {
  metadata {
    name = "jenkins-network-policy"
  }

  spec {
    pod_selector {
      match_labels = {
        app = "jenkins-master"
      }
    }

    ingress {
      from {
        pod_selector {
          match_labels = {
            app = "jenkins-worker"
          }
        }
      }
    }
  }
}

# Scaling and Management (independently scale and manage Jenkins as needed)

# Example HorizontalPodAutoscaler to automatically scale Jenkins pods
resource "kubernetes_horizontal_pod_autoscaler" "jenkins_hpa" {
  metadata {
    name = "jenkins-hpa"
  }

  spec {
    scale_target_ref {
      kind            = "Deployment"
      name            = kubernetes_deployment.jenkins_master.metadata[0].name
      api_version     = "apps/v1"
    }

    min_replicas = 1
    max_replicas = 5 # Adjust based on your scaling requirements

    metrics {
      type = "Resource"

      resource {
        name = "cpu"
        target_average_utilization = 80 # Adjust as needed
      }
    }
  }
}
