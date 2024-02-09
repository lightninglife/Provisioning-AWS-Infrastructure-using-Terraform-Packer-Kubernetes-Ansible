#!/bin/bash

# Define the log file
LOG_FILE="/var/log/userdata.log"

# Redirect all output (stdout and stderr) to the log file
exec >> "$LOG_FILE" 2>&1

AWS_ACCESS_KEY_ID="AKIA53CSBY6XJM5R2AVT"
AWS_SECRET_ACCESS_KEY="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"
AWS_REGION="us-east-1"
CLUSTER_NAME="eks-cluster"

# Update package lists and upgrade existing packages
sudo apt install unzip
sudo apt-get update -y
sudo apt-get upgrade -y

# Install required packages
sudo apt-get install -y jq curl

# Check if AWS CLI is installed
if ! [ -x "$(command -v aws)" ]; then
    echo "Installing AWS CLI..."
    curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
    echo "AWS CLI installed."
else
    echo "AWS CLI is already installed."
fi

# # Configure AWS CLI with your credentials (replace with your AWS access key and secret key)
# if [ ! -d /home/ubuntu/.aws ]; then
#     sudo mkdir -p /home/ubuntu/.aws/
#     sudo touch /home/ubuntu/.aws/credentials
#     sudo chmod -R 777 /home/ubuntu/.aws/credentials
# fi

# cat <<EOL > /home/ubuntu/.aws/credentials
# [default]
# aws_access_key_id = $AWS_ACCESS_KEY_ID
# aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
# EOL


sudo -u ubuntu /usr/local/bin/aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
sudo -u ubuntu /usr/local/bin/aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
sudo -u ubuntu /usr/local/bin/aws configure set  default.region $AWS_REGION
echo "AWS CLI configured with your credentials."

# Install kubectl
if ! [ -x "$(command -v kubectl)" ]; then
    echo "Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
    echo "kubectl installed."
else
    echo "kubectl is already installed."
fi


# Fetch the cluster's certificate authority data
CA_DATA=$(sudo -u ubuntu /usr/local/bin/aws eks describe-cluster --region $AWS_REGION --name $CLUSTER_NAME --query "cluster.certificateAuthority.data" --output text)

# Define the cluster endpoint URL
CLUSTER_ENDPOINT=$(sudo -u ubuntu /usr/local/bin/aws eks describe-cluster --region $AWS_REGION --name $CLUSTER_NAME --query "cluster.endpoint" --output text)

# Install AWS IAM Authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3.us-east-1.amazonaws.com/1.22.0/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin/

# Check if AWS CLI commands were successful
if [ $? -eq 0 ]; then
    # Configure kubeconfig with cluster information
    kubectl config set-cluster $CLUSTER_NAME --server $CLUSTER_ENDPOINT --certificate-authority $CA_DATA
    
    # Update kubeconfig with authentication
    sudo -u ubuntu /usr/local/bin/aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
    
    if [ $? -eq 0 ]; then
        echo "Kubeconfig updated successfully."
    else
        echo "Failed to update kubeconfig."
    fi
else
    echo "Failed to fetch EKS cluster information."
fi


# Redirect output to a log file
sudo touch /var/log/userdata.log
sudo chmod 644 /var/log/userdata.log