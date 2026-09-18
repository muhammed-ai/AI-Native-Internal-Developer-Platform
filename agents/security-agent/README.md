# Security Agent

> Status: **PLANNED**. Interface and boundaries only. No implementation.

## Responsibility

Consolidate security findings into a prioritized assessment. Analysis only — it
does not change policy, gates, or code.

## Reads (tools, read-scoped)

- SAST results (CodeQL)
- Dependency vulnerabilities (Dependabot / Trivy fs / SCA)
- Container image scan results (Trivy)
- SBOM (Syft output)
- Infrastructure security findings (Checkov)

## Produces

- A prioritized security assessment (severity, exploitability, affected components)
- Suggested remediation and ownership
- Traceable references to each finding

## Permissions / boundaries

- Read-only access to scan artifacts and security dashboards.
- **No** ability to modify gates, dismiss findings, or change code/policy.
- Treats all scanner output as untrusted input.

## Interface (planned)

```
assess_security(scope: str) -> SecurityAssessment
```
