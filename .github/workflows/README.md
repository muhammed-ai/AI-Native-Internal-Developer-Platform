# GitHub Actions workflows

Modular workflows, one per concern, so pipelines evolve independently
(see [ADR 0005](../../docs/decisions/0005-use-github-actions-for-cicd.md)).

| Workflow | Concern | Status |
| --- | --- | --- |
| `repo-validate.yml` | Repo structure + Python tests | Active |
| `lint.yml` | YAML + Python lint | Active |
| `terraform.yml` | `terraform fmt`, validate, Checkov | Active (Phase 2) |
| `kubernetes.yml` | Kustomize render + manifest validation | Skeleton (Phase 3) |
| `app-build.yml` | Application build/test | Skeleton (Phase 4) |
| `container.yml` | Image build → scan → SBOM → sign | Skeleton (Phase 5) |
| `security.yml` | Secret detection + CodeQL | Skeleton (Phase 5) |

"Active" workflows run real checks today. "Skeleton" workflows contain placeholder
steps and enable their real tooling in the noted phase. Cloud auth (when added)
will use OIDC federation — no static credentials are stored.
