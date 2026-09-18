# AI-Native Internal Developer Platform

A portfolio-grade Internal Developer Platform (IDP) that gives application
developers a secure, self-service paved road to production — without needing to
master the underlying cloud, Kubernetes, CI/CD, security, and observability
stacks. AI is treated as an engineering component that reasons over real platform
signals, not a chatbot.

> **Status:** Foundation stage. This repository currently contains the
> architecture, documentation, engineering standards, and scaffolding. No cloud
> infrastructure is deployed. Every capability below is labelled honestly.

## Status legend

- **IMPLEMENTED** — present and working in this repo today.
- **PLANNED** — designed and scaffolded; implementation scheduled in a later phase.
- **EXPERIMENTAL** — present but minimal, for exercising the platform.

## What exists today (IMPLEMENTED)

- Repository architecture and modular directory structure.
- Documentation set: architecture, platform design, security model, developer
  guide, incident response, disaster recovery.
- Architecture Decision Records (ADR framework + 7 initial decisions).
- Engineering standards (branching, commits, lint, formatting) and config files.
- CI foundation: active repo-structure + test + lint workflows, and skeleton
  workflows for Terraform, Kubernetes, container supply chain, and security.
- A minimal reference service (`services/sample-api`) — **EXPERIMENTAL**.
- Valid Kustomize base/overlay and example Argo CD manifests — **PLANNED** to deploy.

## Why it exists

Developers should ship production-ready services through consistent, secure
self-service workflows instead of re-learning cloud, cluster, pipeline, and
security plumbing for every project. This repo demonstrates how such a platform is
architected and governed end to end.

## Architecture

```
Developer → Backstage Portal → GitHub → GitHub Actions → Security Gates
    → Container Build/Scan/SBOM/Sign → Registry → Argo CD → Kubernetes (AKS/EKS/GKE)
    → Observability → AI Agents (Deployment / Security / Incident)
```

See [`docs/architecture.md`](docs/architecture.md) for the full diagram and layer
breakdown, and [`docs/decisions/`](docs/decisions/README.md) for the reasoning.

## Key capabilities (target)

Self-service service creation · infrastructure provisioning · CI/CD · GitOps ·
supply-chain security (SAST, SCA, SBOM, image scanning, signing) · secrets
management · observability · incident diagnostics · AI-assisted operations.
All **PLANNED** — see [`docs/platform-design.md`](docs/platform-design.md) for the
capability matrix and current status.

## Technology stack

| Concern | Technology | Role |
| --- | --- | --- |
| Developer portal | Backstage | Self-service (PLANNED) |
| IaC | Terraform | Reproducible infra (PLANNED) |
| Runtime | Kubernetes — AKS / EKS / GKE | Workloads (PLANNED) |
| Delivery | Argo CD | GitOps (PLANNED) |
| CI/CD | GitHub Actions | Pipelines (skeletons IMPLEMENTED) |
| Security | CodeQL, Trivy, Syft, Cosign, Checkov, Kyverno | Supply chain (PLANNED) |
| Observability | Prometheus, Grafana, OpenTelemetry | Signals (PLANNED) |
| AI | Deployment / Security / Incident agents | Ops reasoning (PLANNED) |

## Cloud strategy

Azure is the **primary** cloud (deep implementation). AWS demonstrates
**portability**. GCP demonstrates **foundational** multi-cloud reach. Cloud stacks
are modular, isolated, opt-in, and destroyable — nothing is provisioned
automatically. See [ADR 0006](docs/decisions/0006-azure-as-primary-cloud.md).

## AI architecture

Three focused agents read real platform signals through controlled, least-privilege
tools and require human approval for any action (see
[ADR 0007](docs/decisions/0007-ai-agents-not-chatbot.md) and
[`agents/README.md`](agents/README.md)):

- **Deployment Agent** — diagnoses failed deploys (Actions, Argo CD, K8s).
- **Security Agent** — consolidates SAST/SCA/scan/SBOM/IaC findings.
- **Incident Agent** — correlates metrics/logs/alerts into incident summaries.

## Security approach

Security is built into the delivery path: OIDC-federated cloud auth (no static
keys), keyless artifact signing, SBOMs, image and IaC scanning, and policy-as-code
admission control. See [`docs/security.md`](docs/security.md). None of these are
enforced yet — they are the design contract for later phases.

## Local development

The platform runs locally first (Docker + Kind/Minikube), so no cloud is required
to work on it. Cloud deploys are optional and cost-aware. See
[`docs/developer-guide.md`](docs/developer-guide.md).

```bash
python scripts/validate_structure.py   # verify the scaffold
pytest tests/                           # run foundation tests
```

## Repository structure

```
docs/           Architecture, design, security, guides, and ADRs (docs/decisions/)
terraform/      Modular IaC — reusable modules/ + per-cloud azure/ aws/ gcp/
kubernetes/     Kustomize base/ + overlays/ + applications/
argocd/         GitOps projects/ (trust boundaries) + applications/
platform/       backstage/ — Internal Developer Portal
agents/         AI agents — deployment / security / incident
security/       policies/ sbom/ scanning/ signing/
services/       sample-api/ reference service
scripts/        Repo automation (structure validation)
tests/          Repository/foundation tests
.github/        CI workflows, CODEOWNERS, dependabot, templates
```

The original platform brief is preserved verbatim at
[`docs/PROJECT-BRIEF.md`](docs/PROJECT-BRIEF.md).

## Development roadmap

| Phase | Focus | Status |
| --- | --- | --- |
| 1 | Repository + architecture + local development | IMPLEMENTED |
| 2 | Terraform + cloud foundation | PLANNED |
| 3 | Kubernetes platform | PLANNED |
| 4 | GitHub Actions CI/CD | PLANNED |
| 5 | DevSecOps / supply-chain security | PLANNED |
| 6 | Argo CD / GitOps | PLANNED |
| 7 | Backstage Developer Portal | PLANNED |
| 8 | Observability | PLANNED |
| 9 | AI Deployment Agent | PLANNED |
| 10 | AI Security Agent | PLANNED |
| 11 | AI Incident Agent | PLANNED |
| 12 | Multi-cloud expansion (AWS, GCP) | PLANNED |
| 13 | Platform hardening + documentation | PLANNED |

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for engineering standards. Licensed under
the [MIT License](LICENSE).
