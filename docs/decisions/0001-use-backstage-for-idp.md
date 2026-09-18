# 0001. Use Backstage for the Internal Developer Portal

- **Status:** Accepted
- **Date:** 2026-09-17
- **Deciders:** Platform engineering

## Context

Developers need a single self-service surface to discover services, scaffold new
ones from golden-path templates, and reach docs, CI/CD, deployments, and
observability without learning every underlying tool.

## Decision

Adopt Backstage as the Internal Developer Portal. It is the CNCF-graduated,
widely-adopted standard for developer portals, with a plugin model and a
software-template system that maps directly to our golden-path goal.

## Consequences

- Positive: mature ecosystem, software catalog, TechDocs, scaffolder templates.
- Trade-off: Backstage is a non-trivial Node/TypeScript app to operate; treated as a later phase.
- Follow-up: define the software catalog model and template set in the Backstage phase.

## Alternatives considered

- Build a custom portal — high cost, reinvents a solved problem.
- Port (getport.io) — SaaS, less control, weaker fit for a self-hosted portfolio demo.
