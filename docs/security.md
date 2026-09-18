# Security model

> Status: **PLANNED**. This document describes the intended security architecture
> and the phase in which each control is implemented. No controls are live yet.

## 1. Principles

1. Security is built into the delivery path, not added afterwards.
2. Least privilege everywhere — humans, workloads, and AI agents.
3. No long-lived secrets in the repo or in CI. Prefer workload/federated identity.
4. Every artifact is traceable: SBOM + signature + provenance.
5. Policy is code and enforced automatically.

## 2. Trust boundaries

```
Developer / laptop        ── untrusted until authenticated via GitHub + SSO
        │
GitHub repo + Actions     ── trusted CI, OIDC-federated to clouds (no static keys)
        │
Security gates            ── must pass before an artifact can be promoted
        │
Container registry        ── only signed, scanned images admitted
        │
Argo CD                   ── the only actor that writes to clusters
        │
Kubernetes clusters       ── namespaces + RBAC + admission policy isolate workloads
        │
Cloud control plane       ── managed identities, RBAC, private networking
        │
AI agents                 ── read-mostly, scoped tools, human approval for actions
```

## 3. Supply-chain controls and phases

| Control | Technology (candidate) | Phase |
| --- | --- | --- |
| SAST | GitHub CodeQL | Phase 5 |
| Software Composition Analysis (SCA) | Dependabot, Trivy fs | Phase 5 |
| Secret detection | Gitleaks / GitHub secret scanning | Phase 4-5 |
| SBOM generation | Syft (CycloneDX/SPDX) | Phase 5 |
| Container image scanning | Trivy | Phase 5 |
| Infrastructure security scanning | Checkov | Phase 2 / 5 |
| Kubernetes security validation | Kyverno / OPA Gatekeeper | Phase 3 / 5 |
| Artifact signing | Cosign (keyless, OIDC) | Phase 5 |
| Artifact verification | Cosign verify at admission | Phase 5 / 6 |
| Dependency management | Dependabot | Phase 1 (config present) |

## 4. Identity and secrets

- **CI → cloud:** OIDC federation (GitHub Actions → Azure AD / AWS IAM / GCP WIF).
  No static cloud credentials stored in GitHub.
- **Workload → cloud:** managed identities / IRSA / GKE Workload Identity.
- **Secrets at rest:** Azure Key Vault (primary), AWS Secrets Manager, GCP Secret Manager.
- **In-repo:** only `.example` files. `.gitignore` blocks `.env`, `*.tfvars`, key material.

## 5. AI agent security boundaries

- Agents receive **read-mostly** scoped tools. Any state-changing action requires
  explicit human approval.
- Each agent uses its own least-privilege credential; no shared "god" token.
- Agent tool calls are auditable. Prompts and tool inputs are treated as untrusted.
- See [`agents/README.md`](../agents/README.md) for per-agent permissions.

## 6. What is NOT claimed yet

None of these controls are implemented at the foundation stage. This document is
a design contract for later phases. Do not treat any control here as active.
