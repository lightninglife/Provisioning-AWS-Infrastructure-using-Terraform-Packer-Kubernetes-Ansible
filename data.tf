# data "template_file" "ansible_userdata" {
#   template = file("ansible_userdata.tpl")

#   vars = {
#     aws_access_key_id                                                 = aws_access_key_id
#     aws_secret_access_key                                             = aws_secret_access_key
#     aws_region                                                        = aws_region
#     eks_cluster_ansible_name                                          = eks_cluster_ansible_name
#     aws_eks_node_group_instance_types                                 = aws_eks_node_group_instance_types
#     aws_eks_cluster_ansible_version = aws_eks_cluster_ansible_version
#   }
# }