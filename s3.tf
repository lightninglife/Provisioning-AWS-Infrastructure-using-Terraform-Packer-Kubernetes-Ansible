terraform {
  backend "s3" {
    bucket  = "provisioning-aws-infrastructure-using-terraform"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    profile = "default"
  }
}
