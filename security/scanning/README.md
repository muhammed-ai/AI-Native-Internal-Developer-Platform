# Scanning

> Status: **PLANNED** (Phase 2/5). Config placeholders only; no scans wired to gates yet.

| Scan type | Tool | Runs on |
| --- | --- | --- |
| SAST | GitHub CodeQL | source (CI) |
| SCA / dependencies | Trivy fs, Dependabot | source (CI + scheduled) |
| Container image | Trivy image | built image (CI) |
| IaC | Checkov | `terraform/` (CI) |
| Kubernetes manifests | kubeconform + policy | `kubernetes/` (CI) |

Findings feed the Security Agent's assessment (see [`agents/security-agent/`](../../agents/security-agent/README.md)).
