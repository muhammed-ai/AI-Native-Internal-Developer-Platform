# Platform design

> Status: **PLANNED** foundation. This document describes intended behavior.

## 1. Business problem

Application developers should not need to understand every underlying cloud,
Kubernetes, networking, security, CI/CD, and observability implementation detail
to deploy a production-ready service. Today that knowledge gap slows delivery,
produces inconsistent environments, and pushes security to the end of the cycle.

The IDP encodes the "paved road" so the common case is fast, consistent, and
secure, while still allowing teams to drop to lower layers when they need to.

## 2. Target users

| Persona | What they want from the platform |
| --- | --- |
| Application developer | Create, deploy, and observe a service without deep infra knowledge |
| Platform engineer | Maintain golden paths, modules, and portal templates |
| DevOps engineer | Own CI/CD pipelines and GitOps delivery |
| Security engineer | Enforce supply-chain and runtime security policy |
| SRE | Observe, diagnose, and respond to incidents |

## 3. Platform capabilities

| Capability | Description | Status |
| --- | --- | --- |
| Self-service application creation | Scaffold a new service from a golden-path template | PLANNED |
| Infrastructure provisioning | Terraform modules provision cloud + cluster resources | PLANNED |
| CI/CD | GitHub Actions builds, tests, and gates changes | PLANNED (skeletons) |
| GitOps | Argo CD reconciles cluster state from Git | PLANNED |
| Security validation | SAST, SCA, secret scan, IaC scan in the pipeline | PLANNED (skeletons) |
| SBOM generation | Syft produces SBOMs per artifact | PLANNED |
| Container security | Trivy scans images before promotion | PLANNED |
| Secrets management | Cloud-native vaults + workload identity | PLANNED |
| Observability | Prometheus/Grafana/OpenTelemetry | PLANNED |
| Incident diagnostics | Correlated signals + AI incident summaries | PLANNED |
| AI-assisted workflows | Deployment / Security / Incident agents | PLANNED |

## 4. Golden-path developer workflow

```
Create service (Backstage template)
   → Provision infrastructure (Terraform)
   → Commit code (GitHub)
   → CI security checks (SAST/SCA/secret/IaC scan)
   → Build image
   → Generate SBOM + sign artifact
   → Push image to registry
   → GitOps deployment (Argo CD)
   → Observe service (Prometheus/Grafana/OTel)
   → Diagnose incidents (AI agents)
```

## 5. Deviations from the brief structure

The brief's example tree used the label `agentic-ai-orchestration/` as the root.
This repository is `AI-Native-Internal-Developer-Platform`, so the root name
differs but the internal structure follows the brief. The original brief is
preserved verbatim at [`docs/PROJECT-BRIEF.md`](PROJECT-BRIEF.md).

## 6. Non-goals (at this stage)

- No live cloud infrastructure is deployed.
- No expensive always-on resources are created.
- No fake metrics, screenshots, or claimed capabilities.
- No full agent implementations yet — interfaces and boundaries only.
