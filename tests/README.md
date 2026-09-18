# Tests

> Status: **IMPLEMENTED** (foundation tests only).

Repository-level tests validating the scaffold. As real phases land, add
behavioral tests next to the code they cover.

```bash
pip install pytest
pytest tests/
```

- `test_repo_structure.py` — verifies the expected layout, core docs, and ADRs exist.
