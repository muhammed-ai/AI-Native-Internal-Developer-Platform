# GCP stack — version pinning only. No resources defined yet (PLANNED, Phase 12).
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  # backend "gcs" {}  # configured out-of-band; state never committed
}

# Provider block omitted until implemented. Auth via GitHub OIDC → Workload Identity Federation.
