# sample-api

> Status: **EXPERIMENTAL** reference service. Minimal FastAPI app used to exercise
> the platform's paved road (CI → build → SBOM → scan → sign → GitOps) in later phases.

## Endpoints

| Method | Path | Purpose |
| --- | --- | --- |
| GET | `/` | Basic service info |
| GET | `/healthz` | Liveness probe |

## Run locally

```bash
cd services/sample-api
python -m venv .venv && . .venv/bin/activate   # Windows: .venv\Scripts\Activate.ps1
pip install -r requirements.txt
uvicorn app.main:app --reload --port 8080
# then: curl http://localhost:8080/healthz
```

## Container

```bash
docker build -t sample-api:dev services/sample-api
docker run --rm -p 8080:8080 sample-api:dev
```

The image runs as a non-root user (uid 10001), consistent with
[`security/policies/require-non-root.yaml`](../../security/policies/require-non-root.yaml).
