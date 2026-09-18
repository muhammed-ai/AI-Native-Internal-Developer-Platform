"""Sample API — a minimal reference service for the platform's paved road.

Status: EXPERIMENTAL reference service. It exists to exercise CI, container build,
SBOM, scanning, and GitOps in later phases. It is intentionally tiny.
"""

from fastapi import FastAPI

app = FastAPI(title="sample-api", version="0.1.0")


@app.get("/healthz")
def healthz() -> dict[str, str]:
    """Liveness probe endpoint."""
    return {"status": "ok"}


@app.get("/")
def root() -> dict[str, str]:
    """Root endpoint."""
    return {"service": "sample-api", "message": "AI-Native IDP reference service"}
