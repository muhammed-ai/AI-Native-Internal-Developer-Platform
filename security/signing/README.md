# Signing

> Status: **PLANNED** (Phase 5/6). No artifacts are signed yet.

Artifacts are signed and verified with **Cosign** using keyless (OIDC) signing —
no private keys are stored in the repo or CI.

## Direction

- CI signs the image with `cosign sign` (keyless, GitHub OIDC identity).
- Provenance/SBOM attestations are attached to the image.
- Admission (Kyverno + Cosign verify) rejects unsigned images in later phases.
