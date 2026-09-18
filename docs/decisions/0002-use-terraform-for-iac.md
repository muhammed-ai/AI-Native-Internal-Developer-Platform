# 0002. Use Terraform for Infrastructure as Code

- **Status:** Accepted
- **Date:** 2026-09-17
- **Deciders:** Platform engineering

## Context

Infrastructure must be reproducible and portable across Azure, AWS, and GCP,
with reusable modules so cloud-specific implementations stay isolated.

## Decision

Use Terraform as the primary IaC technology, with a `modules/` directory of
reusable modules consumed by per-cloud stacks (`azure/`, `aws/`, `gcp/`).

## Consequences

- Positive: broad multi-cloud provider support, mature module ecosystem, declarative state.
- Positive: `terraform fmt`/`validate`/`plan` and Checkov give strong local + CI gates.
- Trade-off: state management requires a secure, locked remote backend (never in Git).

## Alternatives considered

- Pulumi — good, but Terraform's provider maturity and ubiquity win for a portfolio.
- Cloud-native tools (Bicep / CloudFormation) — not portable across clouds.
