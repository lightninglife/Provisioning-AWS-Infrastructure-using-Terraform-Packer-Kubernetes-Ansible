terraform {
  backend "s3" {
    bucket         = "terraform-demo-project-paul"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
