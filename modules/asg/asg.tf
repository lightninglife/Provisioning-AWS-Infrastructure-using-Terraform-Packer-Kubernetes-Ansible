resource "aws_launch_template" "web" {
  name_prefix   = var.aws_launch_template_web_name_prefix # "web-lt"
  image_id      = var.aws_launch_template_web_image_id # "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID
  instance_type = var.aws_launch_template_web_instance_type # "t2.micro"

  user_data = filebase64(var.aws_launch_template_web_user_data) # file("${path.module}/../web_userdata.sh")
  

  block_device_mappings {
    device_name = var.aws_launch_template_web_block_device_mappings_device_name # "/dev/sda1"
    ebs {
      volume_size = var.aws_launch_template_web_block_device_mappings_volume_size # 20
    }
  }
  
  key_name = var.key_pair_name
  
  network_interfaces {
    security_groups = var.aws_launch_template_web_network_interfaces_security_groups
    associate_public_ip_address = true
}


  lifecycle {
    create_before_destroy = true # var.aws_launch_template_web_create_before_destroy # true
  }
}


resource "aws_autoscaling_group" "web" {
  desired_capacity     = var.aws_autoscaling_group_web_desired_capacity # 2
  max_size             = var.aws_autoscaling_group_web_max_size # 5
  min_size             = var.aws_autoscaling_group_web_min_size # 1
  vpc_zone_identifier  = var.aws_autoscaling_group_web_vpc_zone_identifier
  launch_template {
    id      = aws_launch_template.web.id
    version = var.aws_autoscaling_group_web_launch_template_version # "$Latest"
  }

  tag {
    key                 = var.aws_autoscaling_group_web_tag_key # "Name"
    value               = var.aws_autoscaling_group_web_tag_value # "web-asg-instance"
    propagate_at_launch = var.aws_autoscaling_group_web_tag_propagate_at_launch # true
  }
}


# ansible

resource "aws_launch_template" "ansible" {
  name_prefix   = var.aws_launch_template_ansible_name_prefix # "web-lt"
  image_id      = var.aws_launch_template_ansible_image_id # "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID
  instance_type = var.aws_launch_template_ansible_instance_type # "t2.micro"

  # user_data = base64encode(var.aws_launch_template_ansible_user_data) # file("${path.module}/../web_userdata.sh")
  user_data = base64encode(<<-EOT
  #!/bin/bash
  set -ex
  sudo yum update -y
  sudo amazon-linux-extras install ansible2 -y

  # Define the log file
  LOG_FILE=${var.log_file}

  # Redirect all output (stdout and stderr) to the log file
  exec >> "$LOG_FILE" 2>&1

  AWS_ACCESS_KEY_ID=${var.aws_access_key_id}
  AWS_SECRET_ACCESS_KEY=${var.aws_secret_access_key}
  AWS_REGION=${var.aws_region}
  CLUSTER_NAME=${var.eks_cluster_ansible_name}
  NODE_GROUP_INSTANCE_TYPE=${var.aws_eks_node_group_instance_types}
  KUBERNETES_VERSION=${var.aws_eks_cluster_ansible_version}

  sudo -u ec2-user /usr/bin/aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
  sudo -u ec2-user /usr/bin/aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
  sudo -u ec2-user /usr/bin/aws configure set  default.region $AWS_REGION
  echo "AWS CLI configured with your credentials."

  # Install kubectl
  if ! [ -x "$(command -v kubectl)" ]; then
      echo "Installing kubectl..."
      curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
      chmod +x kubectl
      sudo mv kubectl /usr/bin/
      echo "kubectl installed."
  else
      echo "kubectl is already installed."
  fi
  
  # Fetch Kubectl Info
  sudo -u ec2-user /usr/bin/aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME

  # Fetch max pods
  curl -O https://raw.githubusercontent.com/awslabs/amazon-eks-ami/master/files/max-pods-calculator.sh
  chmod +x max-pods-calculator.sh

  # Fetch the cluster's certificate authority data
  CERTIFICATE_AUTHORITY=$(sudo -u ec2-user /usr/bin/aws eks describe-cluster --query "cluster.certificateAuthority.data" --output text --name $CLUSTER_NAME --region $AWS_REGION)

  # Define the cluster endpoint URL
  API_SERVER_ENDPOINT=$(sudo -u ec2-user /usr/bin/aws eks describe-cluster --region $AWS_REGION --name $CLUSTER_NAME --query "cluster.endpoint" --output text)

  # Fetch the cluster's CIDR
  SERVICE_CIDR=$(sudo -u ec2-user /usr/bin/aws eks describe-cluster --query "cluster.kubernetesNetworkConfig.serviceIpv4Cidr" --output text --name $CLUSTER_NAME --region $AWS_REGION | sed 's/\.0\/16//')

  CNI_VERSION=$(sudo -u ec2-user /usr/bin/aws eks describe-addon-versions --addon-name vpc-cni --kubernetes-version $KUBERNETES_VERSION --region $AWS_REGION | jq -r '.addons[] | select(.addonName == "vpc-cni") | .addonVersions[].addonVersion' | head -n 1 | sed 's/^v//')

  MAX_PODS=$(./max-pods-calculator.sh --instance-type $NODE_GROUP_INSTANCE_TYPE --cni-version $CNI_VERSION)

  # Join worker nodes to the eks cluster
  /etc/eks/bootstrap.sh eks-cluster $CLUSTER_NAME \
    --b64-cluster-ca $CERTIFICATE_AUTHORITY \
    --apiserver-endpoint $API_SERVER_ENDPOINT \
    --dns-cluster-ip $SERVICE_CIDR.10 \
    --kubelet-extra-args "--max-pods=$MAX_PODS" \
    --use-max-pods false
  EOT
  )


  
  vpc_security_group_ids = var.aws_launch_template_ansible_vpc_security_group_ids
  
  block_device_mappings {
    device_name = var.aws_launch_template_ansible_block_device_mappings_device_name # "/dev/sda1"
    ebs {
      volume_size = var.aws_launch_template_ansible_block_device_mappings_volume_size # 20
    }
  }
  
  key_name = var.key_pair_name
  
  # network_interfaces {
  #   security_groups = var.aws_launch_template_ansible_network_interfaces_security_groups
  #   associate_public_ip_address = true
  # }


  lifecycle {
    create_before_destroy = true # var.aws_launch_template_web_create_before_destroy # true
  }
}

resource "aws_autoscaling_group" "ansible" {
  desired_capacity     = var.aws_autoscaling_group_ansible_desired_capacity # 2
  max_size             = var.aws_autoscaling_group_ansible_max_size # 5
  min_size             = var.aws_autoscaling_group_ansible_min_size # 1
  vpc_zone_identifier  = var.aws_autoscaling_group_ansible_vpc_zone_identifier
  launch_template {
    id      = aws_launch_template.ansible.id
    version = var.aws_autoscaling_group_ansible_launch_template_version # "$Latest"
  }

  tag {
    key                 = var.aws_autoscaling_group_ansible_tag_key # "Name"
    value               = var.aws_autoscaling_group_ansible_tag_value # "web-asg-instance"
    propagate_at_launch = var.aws_autoscaling_group_ansible_tag_propagate_at_launch # true
  }
}
