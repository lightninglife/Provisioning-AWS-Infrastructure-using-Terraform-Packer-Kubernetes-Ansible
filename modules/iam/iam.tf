# IAM for cluster
resource "aws_iam_role" "eks_cluster_ansible" {
  name = var.aws_iam_role_eks_cluster_ansible_name # "ansible-cluster-role"

  assume_role_policy = var.aws_iam_role_eks_cluster_assume_role_policy_ansible #  file("${path.module}/assume_role_policy.json")
}


# Associate IAM Policy to IAM Role for cluster
resource "aws_iam_role_policy_attachment" "eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_ansible.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster_ansible.name
}


# IAM for node group

resource "aws_iam_role" "eks_nodegroup_role_ansible" {
  name = var.aws_iam_role_eks_nodegroup_role_ansible_name

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = ["ec2.amazonaws.com", "eks.amazonaws.com"]
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy" "eks_nodegroup_role_ansible_policy" {
  name   = "eks-nodegroup-role-ansible-describe"
  role   = aws_iam_role.eks_nodegroup_role_ansible.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "eks:DescribeCluster",
          "eks:AccessKubernetesApi"
        ],
        Effect   = "Allow",
        Resource = "*"  # You can specify the ARN of your EKS cluster if needed.
      }
    ]
  })
}

# resource "aws_iam_policy_attachment" "eks_nodegroup_role_ansible_attachment" {
#   name        = "eks_nodegroup_role_ansible_attachment"  # Unique name
#   policy_arn  = aws_iam_role_policy.eks_nodegroup_role_ansible_policy.name
#   roles       = [aws_iam_role.eks_nodegroup_role_ansible.id]
# }


resource "aws_iam_policy_attachment" "eks_worker_node_policy" {
  name        = "eks-worker-node-policy-attachment"  # Unique name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  roles       = [aws_iam_role.eks_nodegroup_role_ansible.id]
}


resource "aws_iam_policy_attachment" "eks_cni_policy_attachment" {
  name = "eamazoneks_cni-policy"  
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  roles       = [aws_iam_role.eks_nodegroup_role_ansible.id]
}

resource "aws_iam_policy_attachment" "eks_ec2_container_registry_readonly" {
  name = "eks_worker_nodes_policy"  
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  roles       = [aws_iam_role.eks_nodegroup_role_ansible.id]
}





# resource "aws_iam_policy" "eks_worker_nodes_policy" {
#   name_prefix = "eks-worker-nodes-policy-"

#   description = "IAM policy for worker nodes in EKS cluster"

#   # Permissions for EKS cluster
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = [
#           "eks:DescribeCluster",
#           "eks:ListNodegroups",
#           "eks:ListUpdates",
#           "eks:ListClusters",
#           "eks:AccessKubernetesApi"
#         ],
#         Effect   = "Allow",
#         Resource = "*",
#       },
#       {
#         Action = [
#           "autoscaling:DescribeAutoScalingGroups",
#           "autoscaling:DescribeAutoScalingInstances",
#           "autoscaling:DescribeLaunchConfigurations",
#           "ec2:DescribeLaunchTemplateVersions"
#         ],
#         Effect   = "Allow",
#         Resource = "*",
#       },
#     ],
#   })
# }

# data "aws_iam_policy_document" "eks_instance_policy" {
#   statement {
#     actions = [
#       "eks:DescribeCluster",
#       "eks:AccessKubernetesApi"
#     ]

#     resources = ["*"]  # You can specify the ARN of a specific EKS cluster if needed.
#   }
# }

# resource "aws_iam_policy" "eks_instance_policy" {
#   name        = "eks-instance-policy"
#   description = "IAM policy for EC2 instances to interact with EKS"

#   policy = data.aws_iam_policy_document.eks_instance_policy.json
# }

# resource "aws_iam_role" "eks_instance_role" {
#   name = "eks-instance-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       }
#     ]
#   })

# }

# resource "aws_iam_instance_profile" "eks_instance_profile" {
#   name = "eks-instance-profile"
#   role = aws_iam_role.eks_instance_role.name
# }


# resource "aws_iam_policy_attachment" "eks_instance_role" {
#   name = "eks_instance_profile_attachment"  
#   policy_arn = aws_iam_policy.eks_instance_policy.arn
#   roles       = [aws_iam_role.eks_instance_role.id]
# }