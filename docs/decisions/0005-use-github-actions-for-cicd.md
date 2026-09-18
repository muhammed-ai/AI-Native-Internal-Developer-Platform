# 0005. Use GitHub Actions for CI/CD

- **Status:** Accepted
- **Date:** 2026-09-17
- **Deciders:** Platform engineering

## Context

The repository lives on GitHub. CI/CD should be close to the code, support OIDC
federation to clouds (no static keys), and integrate with the security ecosystem
(CodeQL, Dependabot).

## Decision

Use GitHub Actions as the primary CI/CD system. Workflows are modular per concern
(Terraform validation, app build/test, container build, container scan, SBOM,
Kubernetes validation, security checks) so they can evolve independently.

## Consequences

- Positive: native to GitHub, OIDC to Azure/AWS/GCP removes static cloud secrets.
- Positive: first-class CodeQL and Dependabot integration.
- Trade-off: some vendor coupling to GitHub; acceptable given the repo already lives there.

## Alternatives considered

- Jenkins — heavier to operate, no benefit for this scope.
- GitLab CI — would require moving the repo off GitHub.
