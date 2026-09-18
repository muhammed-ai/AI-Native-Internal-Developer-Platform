# AWS stack (secondary — portability)

> Status: **PLANNED**. Only `versions.tf` exists. No resources are defined.

Demonstrates multi-cloud portability. Intended scope (kept lean): EKS, ECR, IAM,
VPC, Secrets Manager — provisioned via the shared modules. Auth via GitHub OIDC
to an IAM role; state in a remote locked backend.
