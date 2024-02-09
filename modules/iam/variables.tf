#iam
variable "aws_iam_role_eks_cluster_ansible_name" {
  description = "Iam role name for esk cluster"
  type        = string
}

variable "aws_iam_role_eks_cluster_assume_role_policy_ansible" {
  description = "file of the policy ansible"
  type        = string
}

variable "aws_iam_role_eks_nodegroup_role_ansible_name" {
  description = "Name of the IAM role associated with EKS nodegroups for Ansible"
  type        = string
  # You can set a default value if needed
  # default     = "example-role-name"
}
