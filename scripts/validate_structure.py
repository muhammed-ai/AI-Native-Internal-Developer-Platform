#!/usr/bin/env python3
"""Validate that the expected repository structure exists.

This is a real, runnable check used locally and in CI. It asserts the foundational
directories and key files are present. It does NOT touch any cloud or cluster.
"""

from __future__ import annotations

import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]

REQUIRED_PATHS = [
    "README.md",
    "LICENSE",
    ".gitignore",
    ".editorconfig",
    "docs/architecture.md",
    "docs/platform-design.md",
    "docs/security.md",
    "docs/developer-guide.md",
    "docs/incident-response.md",
    "docs/disaster-recovery.md",
    "docs/decisions/README.md",
    "terraform/README.md",
    "terraform/modules",
    "terraform/azure",
    "terraform/aws",
    "terraform/gcp",
    "kubernetes/base/kustomization.yaml",
    "kubernetes/overlays/local/kustomization.yaml",
    "kubernetes/applications",
    "argocd/applications",
    "argocd/projects",
    "platform/backstage/README.md",
    "agents/README.md",
    "agents/deployment-agent",
    "agents/security-agent",
    "agents/incident-agent",
    "security/policies",
    "security/sbom",
    "security/scanning",
    "security/signing",
    "services/sample-api",
    "scripts",
    "tests",
    ".github/workflows",
]


def main() -> int:
    missing = [p for p in REQUIRED_PATHS if not (REPO_ROOT / p).exists()]
    if missing:
        print("Missing expected paths:", file=sys.stderr)
        for p in missing:
            print(f"  - {p}", file=sys.stderr)
        return 1
    print(f"OK: all {len(REQUIRED_PATHS)} expected paths present.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
