output "eks_ansible_cluster_iam_role_arn" {
  value = aws_iam_role.eks_cluster_ansible.arn
}

output "eks_ansible_nodegroup_iam_role_arn" {
  value = aws_iam_role.eks_nodegroup_role_ansible.arn
}

# output "eks_ansible_nodegroup_instance_iam_role_arn" {
#   value = aws_iam_instance_profile.eks_instance_profile.arn
# }

output "eks_worker_node_policy_attachment_ansible" {
  value = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

output "eks_cni_policy_attachment_ansible" {
  value = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

output "eks_ec2_container_registry_readonly_attachment_ansible" {
  value = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}