# AWS stack — version pinning only. No resources defined yet (PLANNED, Phase 12).
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend "s3" {}  # configured out-of-band; state never committed
}

# Provider block omitted until implemented. Auth via GitHub OIDC → IAM role.
