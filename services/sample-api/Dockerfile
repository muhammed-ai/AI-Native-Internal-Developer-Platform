# Multi-stage, non-root, minimal image for the reference service.
FROM python:3.14-slim AS base

# Create a non-root user (aligns with the require-non-root policy).
RUN useradd --create-home --uid 10001 appuser
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

USER appuser
EXPOSE 8080

# Container listens on 8080; health at /healthz.
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
