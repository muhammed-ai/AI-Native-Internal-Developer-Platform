# Architecture Decision Records (ADRs)

This directory captures significant architectural decisions using lightweight ADRs.
Each ADR is immutable once accepted; if a decision changes, add a new ADR that
supersedes the old one rather than editing history.

## Format

We use a compact MADR-style format. See [`0000-template.md`](0000-template.md).

## Status values

- **Proposed** – under discussion
- **Accepted** – decided and in effect
- **Superseded** – replaced by a later ADR (link it)
- **Deprecated** – no longer relevant

## Index

| ADR | Title | Status |
| --- | --- | --- |
| [0001](0001-use-backstage-for-idp.md) | Use Backstage for the Internal Developer Portal | Accepted |
| [0002](0002-use-terraform-for-iac.md) | Use Terraform for Infrastructure as Code | Accepted |
| [0003](0003-use-kubernetes-as-runtime.md) | Use Kubernetes as the runtime platform | Accepted |
| [0004](0004-use-argocd-for-gitops.md) | Use Argo CD for GitOps delivery | Accepted |
| [0005](0005-use-github-actions-for-cicd.md) | Use GitHub Actions for CI/CD | Accepted |
| [0006](0006-azure-as-primary-cloud.md) | Azure as the primary cloud | Accepted |
| [0007](0007-ai-agents-not-chatbot.md) | AI agents as engineering components, not a chatbot | Accepted |
