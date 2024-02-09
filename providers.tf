provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# data "aws_eks_cluster" "ansible" {
#   name = module.eks.eks_cluster_ansible_name
# }

# data "aws_eks_cluster_auth" "ansible" {
#   name = module.eks.eks_cluster_ansible_name
# }

# provider "kubernetes" {
#   host                   = module.eks.eks_cluster_ansible_endpoint
#   cluster_ca_certificate = data.aws_eks_cluster.ansible.certificate_authority[0].data
#   token                  = data.aws_eks_cluster_auth.ansible.token
# }