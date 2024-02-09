output "eks_cluster_ansible_endpoint" {
    value = aws_eks_cluster.ansible.endpoint
}

output "eks_cluster_ansible_certificate_authority" {
    value = aws_eks_cluster.ansible.certificate_authority
}

output "eks_cluster_ansible_name" {
    value = aws_eks_cluster.ansible.name
}


output "eks_nodegroup_ansible_name" {
    value = aws_eks_node_group.ansible.id
}

data "aws_eks_cluster" "eks_cluster_ansible" {
  name = aws_eks_cluster.ansible.name # Replace with your EKS cluster name

  depends_on = [aws_eks_cluster.ansible]
}

output "eks_cluster_security_group_ids" {
  value = data.aws_eks_cluster.eks_cluster_ansible.vpc_config[0].security_group_ids
}