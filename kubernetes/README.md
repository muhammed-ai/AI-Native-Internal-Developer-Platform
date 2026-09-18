# Kubernetes

> Status: **PLANNED** foundation. A minimal, valid Kustomize skeleton exists so
> tooling can be validated. No workloads are deployed.

## Layout

```
kubernetes/
├── base/           Common, environment-agnostic manifests (Kustomize base)
├── overlays/       Per-environment patches (local, and later cloud environments)
│   └── local/      Kind/Minikube overlay for local development
└── applications/   Per-application manifests wired into GitOps later
```

We use Kustomize (`base` + `overlays`) so environment and cloud specifics stay
separate (see [ADR 0003](../docs/decisions/0003-use-kubernetes-as-runtime.md)).

## Local validation (no cluster required)

```bash
kubectl kustomize kubernetes/overlays/local
# optionally pipe to a validator:
kubectl kustomize kubernetes/overlays/local | kubeconform -strict
```

## Security direction

Workloads will be governed by admission policy (Kyverno/OPA) and only deployed by
Argo CD (see the [security model](../docs/security.md)). Policy scaffolding lives
under `security/policies/`.
