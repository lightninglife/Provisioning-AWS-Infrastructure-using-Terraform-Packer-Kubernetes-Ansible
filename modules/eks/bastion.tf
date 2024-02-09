resource "aws_instance" "eks_cluster_ansible_bastion_host" {
  ami           = var.aws_instance_eks_cluster_ansible_bastion_host_ami # "ami-12345678"  # Specify an appropriate AMI for your region
  instance_type = var.aws_instance_eks_cluster_ansible_bastion_host_instance_type # "t2.micro"
  key_name      = var.key_pair_name
  subnet_id     = var.aws_instance_eks_cluster_ansible_bastion_host_subnet_id # "subnet-12345678"  # Specify the ID of your public subnet

  security_groups = var.aws_instance_eks_cluster_ansible_bastion_host_security_groups # aws_security_group.bastion_host_sg.id

  tags = {
    Name = var.aws_instance_eks_cluster_ansible_bastion_host_tags # "bastion-host"
  }

  provisioner "file" {
    source      = var.aws_instance_eks_cluster_ansible_bastion_host_provisioner_source # "/path/to/your/key.pem"
    destination = var.aws_instance_eks_cluster_ansible_bastion_host_provisioner_destination # "/home/ec2-user/key.pem"  # Adjust the destination path as needed
    
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.aws_instance_eks_cluster_ansible_bastion_host_provisioner_source)
      host        = self.public_ip
    }
    

  }
}

resource "null_resource" "trigger_remote_exec" {
  depends_on = [aws_instance.eks_cluster_ansible_bastion_host]

  provisioner "remote-exec" {
    inline = var.aws_instance_eks_cluster_ansible_bastion_host_remote_exec_inline # "chmod 400 /home/ec2-user/web-ec2.pem"


    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.aws_instance_eks_cluster_ansible_bastion_host_provisioner_source)  # Specify the path to your private key
      host        = aws_instance.eks_cluster_ansible_bastion_host.public_ip
  }
  }
}

resource "aws_eip" "eks_cluster_ansible_bastion_eip" {
  instance = aws_instance.eks_cluster_ansible_bastion_host.id
}

# Define other resources such as route tables, security groups for EKS worker nodes, etc.
