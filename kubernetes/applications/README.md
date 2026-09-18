# Applications

> Status: **PLANNED**. Per-application Kubernetes manifests live here and are wired
> into GitOps via Argo CD (`argocd/applications/`). Empty at the foundation stage.

Each application will get its own Kustomize base + overlays, referencing images
built and signed by CI. The reference service is `services/sample-api/`.
