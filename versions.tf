terraform {
  required_version = "~>1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    # You can specify additional required providers here.
  }
}

# Note: Replace the version constraints with those appropriate for your project.
