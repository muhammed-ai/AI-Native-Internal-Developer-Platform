# Argo CD (GitOps)

> Status: **PLANNED**. Example manifests illustrate the intended model. Argo CD is
> not installed and these are not applied.

Argo CD is the only actor that writes to clusters (see
[ADR 0004](../docs/decisions/0004-use-argocd-for-gitops.md) and the
[security model](../docs/security.md)).

## Layout

```
argocd/
├── projects/       AppProject definitions = trust boundaries (allowed repos, clusters, namespaces)
└── applications/   Application definitions binding a Git source to a target cluster/namespace
```

## Model

- A `platform` AppProject constrains what can be deployed and where.
- Each `Application` points at a path in this repo (e.g. `kubernetes/overlays/local`)
  and syncs it to a target namespace.
- An app-of-apps pattern can bootstrap the platform in later phases.
