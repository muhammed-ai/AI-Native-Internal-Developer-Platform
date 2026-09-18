# SBOM

> Status: **PLANNED** (Phase 5). No SBOMs are generated yet.

Software Bills of Materials are generated per build artifact with **Syft** in
CycloneDX (and/or SPDX) format, then attached to the artifact and scanned.

## Direction

- CI step runs `syft <image> -o cyclonedx-json` after build.
- SBOM is uploaded as a build artifact and (later) attested with Cosign.
- Generated SBOM files are git-ignored (`*.sbom.json`, `*.cdx.json`, `*.spdx.json`).
