# Security

> Status: **PLANNED**. This directory holds the supply-chain and policy scaffolding.
> Tools are documented and one example policy is provided; nothing is enforced yet.
> See the full [security model](../docs/security.md).

## Layout

```
security/
├── policies/    Admission/policy-as-code (Kyverno/OPA) — governs what runs in clusters
├── sbom/        SBOM generation config + output location (Syft)
├── scanning/    SAST / SCA / IaC / container scan config (CodeQL, Trivy, Checkov)
└── signing/     Artifact signing + verification (Cosign, keyless/OIDC)
```

## Control → tool → phase

| Control | Tool (candidate) | Phase |
| --- | --- | --- |
| SAST | GitHub CodeQL | 5 |
| SCA | Dependabot, Trivy fs | 5 |
| Secret detection | Gitleaks / GitHub secret scanning | 4-5 |
| SBOM | Syft (CycloneDX/SPDX) | 5 |
| Container scan | Trivy | 5 |
| IaC scan | Checkov | 2 / 5 |
| K8s admission policy | Kyverno / OPA Gatekeeper | 3 / 5 |
| Artifact signing | Cosign (keyless) | 5 |
| Artifact verification | Cosign verify (at admission) | 5 / 6 |

## Principles

- Secure by default; gates live in the delivery path, not bolted on afterward.
- No secrets in the repo. Signing uses keyless OIDC (no private keys committed).
- Policy is code and version-controlled here.
