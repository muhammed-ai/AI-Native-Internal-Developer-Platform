# Example variable values for the Azure stack.
# Copy to a real tfvars file (which is git-ignored) and fill in globally-unique
# names before running `terraform plan`. Do NOT commit real tfvars.

name_prefix = "idp"
location    = "westeurope"

# Must be globally unique.
acr_name       = "idpacr0001"  # 5-50 alphanumeric, no hyphens
key_vault_name = "idp-kv-0001" # 3-24 chars

# Pin a supported AKS version for reproducibility (null = Azure default).
kubernetes_version = null

# Optional: enable GitHub Actions OIDC federation on the platform identity.
# github_oidc_subject = "repo:muhammed-ai/AI-Native-Internal-Developer-Platform:ref:refs/heads/main"

tags = {
  project = "ai-native-idp"
  managed = "terraform"
  env     = "demo"
}
