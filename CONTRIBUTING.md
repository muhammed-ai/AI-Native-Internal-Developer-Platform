# Contributing / engineering standards

Standards for the AI-Native Internal Developer Platform. Kept intentionally light
at the foundation stage.

## Branching

- `main` is protected and always deployable.
- Work on short-lived branches: `feat/...`, `fix/...`, `docs/...`, `chore/...`.

## Commit messages

Conventional Commits: `type(scope): summary`.
Types: `feat`, `fix`, `docs`, `chore`, `ci`, `refactor`, `test`, `deps`.
Example: `feat(terraform): add azure network module`.

## Pull requests

- Small and focused. Fill out the PR template.
- CI must pass. CODEOWNERS review required.
- Update docs and status labels (IMPLEMENTED / PLANNED / EXPERIMENTAL) when behavior changes.

## Code standards

| Area | Tool | Command |
| --- | --- | --- |
| Terraform format | `terraform fmt` | `terraform fmt -recursive terraform/` |
| Terraform validate | `terraform validate` | per stack, `-backend=false` locally |
| IaC security | Checkov | `checkov -d terraform/` |
| Kubernetes | Kustomize + kubeconform | `kubectl kustomize ... \| kubeconform -strict` |
| YAML | yamllint | `yamllint .` |
| Python | ruff | `ruff check .` |
| Tests | pytest | `pytest tests/` |
| Structure | script | `python scripts/validate_structure.py` |

## Security

- Never commit secrets. Use `.example` files for shapes.
- Cloud auth uses OIDC federation — no static keys in the repo or CI.
- Signing is keyless (Cosign/OIDC). See the [security model](docs/security.md).

## Documentation

- Every significant architectural decision gets an ADR under `docs/decisions/`.
- Do not claim capabilities that are not implemented. Label status honestly.

## Cost control

Do not create expensive or always-on cloud resources automatically. Cloud stacks
are opt-in and destroyable. See the [platform brief](docs/PROJECT-BRIEF.md).
