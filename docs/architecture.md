# Architecture

> Status legend: **IMPLEMENTED** · **PLANNED** · **EXPERIMENTAL**
> At this stage the repository is a **foundation**. Almost everything below is **PLANNED** unless marked otherwise.

## 1. Purpose

The AI-Native Internal Developer Platform (IDP) gives application developers a
paved road to ship production-grade services without having to master the
underlying cloud, Kubernetes, networking, security, CI/CD, and observability
stacks. Platform capabilities are exposed through self-service workflows, and
AI agents operate against real platform data rather than acting as a chatbot.

## 2. High-level architecture

```
Developer
   │
   ▼
Backstage Developer Portal ──────────────┐
   │                                      │
   ▼                                      ▼
GitHub Repository                   Platform Services
   │                                      │
   ▼                                      ▼
GitHub Actions (CI)                 Terraform (IaC)
   │                                      │
   ▼                                      │
Security Gates ◀──────────────────────────┘
   │  SAST · SCA · Secret scan · IaC scan · SBOM
   ▼
Container Build → Container Scan → Artifact Sign
   │
   ▼
Container Registry (ACR / ECR / Artifact Registry)
   │
   ▼
Argo CD (GitOps)
   │
   ▼
Kubernetes ── AKS (primary) · EKS (secondary) · GKE (foundational)
   │
   ▼
Observability (Prometheus · Grafana · OpenTelemetry)
   │
   ▼
AI / Agentic Layer
   ├─ Deployment Agent
   ├─ Security Agent
   └─ Incident Agent
```

## 3. Layers

| Layer | Responsibility | Primary technology | Status |
| --- | --- | --- | --- |
| Developer portal | Discovery, self-service, golden-path templates | Backstage | PLANNED |
| Source & CI | Version control, pipelines, security gates | GitHub + GitHub Actions | PLANNED (skeletons present) |
| Infrastructure as Code | Reproducible cloud provisioning | Terraform | PLANNED (module layout present) |
| Delivery | GitOps continuous delivery | Argo CD | PLANNED |
| Runtime | Container orchestration | Kubernetes (AKS/EKS/GKE) | PLANNED |
| Supply-chain security | SAST, SCA, SBOM, image scan, signing, policy | CodeQL, Trivy, Syft, Cosign, Checkov, Kyverno/OPA | PLANNED |
| Observability | Metrics, logs, traces | Prometheus, Grafana, OpenTelemetry | PLANNED |
| AI / Agentic | Operational reasoning over real signals | Agents + MCP/tool interfaces | PLANNED |

## 4. Design principles

1. **Reproducible** – all infrastructure is codified in Terraform.
2. **Automated** – changes flow through CI/CD and GitOps, not manual steps.
3. **Secure by default** – security gates are part of the delivery path, not bolt-ons.
4. **Self-service** – developers consume golden paths through Backstage.
5. **Modular** – each component (cloud, cluster, agent) can be built and tested independently.
6. **Cost-aware** – the platform runs locally first; cloud is optional and destroyable.
7. **AI as an engineering component** – agents read real platform state through controlled tools.

## 5. Modularity and boundaries

- **Cloud isolation:** `terraform/azure`, `terraform/aws`, and `terraform/gcp`
  consume shared, reusable modules from `terraform/modules` but never depend on
  each other.
- **Cluster isolation:** Kubernetes manifests use a `base` + `overlays` (Kustomize)
  model so environment and cloud specifics stay separate.
- **Delivery isolation:** Argo CD `projects` define trust boundaries;
  `applications` bind Git sources to clusters.
- **Agent isolation:** each agent has a narrow, documented tool surface and least-privilege
  credentials (see [AI agent architecture](#) in `agents/README.md`).

## 6. Environments

| Environment | Where it runs | Purpose | Status |
| --- | --- | --- | --- |
| Local | Docker + Kind/Minikube | Day-to-day development, CI validation | PLANNED |
| Cloud (ephemeral) | AKS / EKS / GKE | Demonstrations, then destroyed | PLANNED |

## 7. Related documents

- [Platform design](platform-design.md)
- [Security model](security.md)
- [Developer guide](developer-guide.md)
- [Incident response](incident-response.md)
- [Disaster recovery](disaster-recovery.md)
- [Architecture Decision Records](decisions/README.md)
