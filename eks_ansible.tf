provider "aws" {
  region = "us-west-2" # Change to your desired region
}

resource "aws_eks_cluster" "example" {
  name     = "example-cluster"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = ["subnet-xxxxxx", "subnet-yyyyyy"] # Replace with your subnet IDs
  }
}

resource "aws_iam_role" "eks_cluster" {
  name = "example-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = "example-node-group"
  node_role_arn   = aws_iam_role.example.arn
  subnet_ids      = ["subnet-xxxxxx", "subnet-yyyyyy"] # Replace with your subnet IDs
  instance_types  = ["t2.micro"]
  desired_capacity = 2
  min_size        = 1
  max_size        = 3

  launch_template {
    name_prefix = "example"
    version     = "$Latest"

    block_device_mappings {
      device_name = "xvda"
      ebs {
        volume_size = 20
      }
    }

    data_source_id = aws_eks_cluster.example.id
    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install -y ansible
                # Additional Ansible configuration and playbook execution if needed
                EOF
  }
}
