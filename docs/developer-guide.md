# Developer guide

> Status: **PLANNED**. Commands below describe the intended local workflow.
> Tooling is not fully wired up yet at the foundation stage.

## 1. Prerequisites (local-first)

To keep this project cheap and reproducible, everything runs locally before any
cloud is involved. Intended local toolchain:

- Docker
- Kind or Minikube (local Kubernetes)
- kubectl + kustomize
- Terraform (for `fmt`/`validate` — no cloud apply needed locally)
- Python 3.11+ (agents)
- Node 20+ (Backstage, later phases)

## 2. Repository layout

See the tree in the [README](../README.md#repository-structure). In short:

- `terraform/` — reproducible infrastructure (modular, per cloud)
- `kubernetes/` — base manifests + environment overlays
- `argocd/` — GitOps application and project definitions
- `platform/backstage/` — the developer portal
- `agents/` — AI operational agents
- `security/` — policies, SBOM, scanning, signing config
- `services/sample-api/` — a reference service to exercise the paved road
- `scripts/` — helper automation
- `tests/` — repository and platform tests

## 3. Intended golden-path workflow

1. Create a new service from a Backstage template.
2. Provision infrastructure with the relevant Terraform stack.
3. Commit code — CI runs security gates automatically.
4. CI builds the image, generates an SBOM, and signs the artifact.
5. The image is pushed to the registry.
6. Argo CD deploys the new version via GitOps.
7. Observe the service in Grafana; traces flow through OpenTelemetry.
8. If something breaks, the AI agents help diagnose it.

## 4. Local validation you can run today

```bash
# Format and validate Terraform (once modules contain real config)
terraform fmt -check -recursive terraform/
terraform -chdir=terraform/azure validate

# Validate Kubernetes manifests (once manifests exist)
kubectl kustomize kubernetes/overlays/local | kubeconform -strict

# Lint YAML
yamllint .

# Python agents
ruff check agents/
pytest tests/
```

These commands are the targets the CI skeletons in `.github/workflows/` are built
around. Some will be no-ops until the corresponding phase lands.

## 5. Branching and contribution

See [engineering standards](../CONTRIBUTING.md) for branching, commit message,
and pull-request conventions.
