# Policies (policy-as-code)

> Status: **PLANNED**. Example policy provided in **Audit** mode conceptually; no
> policy engine is installed, so nothing is enforced.

Kubernetes admission policies (Kyverno, with OPA/Gatekeeper as an alternative)
govern what is allowed to run. Policies graduate from `Audit` to `Enforce` as the
platform matures.

## Example

- [`require-non-root.yaml`](require-non-root.yaml) — rejects containers that do not
  set `runAsNonRoot: true`.

## Direction

Planned baseline policies: non-root, read-only root filesystem, drop capabilities,
disallow `latest` image tags, and require signed images (Cosign verification).
