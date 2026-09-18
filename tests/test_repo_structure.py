"""Repository structure tests.

Foundation-stage tests that verify the scaffold is intact. As real phases land,
add behavioral tests alongside the code they cover.
"""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]


def test_validate_structure_script_passes() -> None:
    """The structure validation script should exit 0."""
    result = subprocess.run(
        [sys.executable, str(REPO_ROOT / "scripts" / "validate_structure.py")],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, result.stderr


def test_key_docs_exist() -> None:
    """Core documentation must be present."""
    for doc in [
        "docs/architecture.md",
        "docs/security.md",
        "docs/decisions/README.md",
    ]:
        assert (REPO_ROOT / doc).is_file(), f"missing {doc}"


def test_adrs_present() -> None:
    """At least the seven initial ADRs should exist."""
    adrs = list((REPO_ROOT / "docs" / "decisions").glob("0*.md"))
    # 0000 template + 0001..0007
    assert len(adrs) >= 8, f"expected >=8 ADR files, found {len(adrs)}"
