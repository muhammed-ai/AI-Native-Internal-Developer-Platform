# 0007. AI agents as engineering components, not a chatbot

- **Status:** Accepted
- **Date:** 2026-09-17
- **Deciders:** Platform engineering

## Context

"AI-native" is easy to fake with a text chatbot. To be credible, AI must operate
on real platform signals (CI runs, Argo CD state, Kubernetes events, scan results,
metrics/logs) through controlled tools, with least privilege and human approval
for any action.

## Decision

Treat AI as an engineering component. Build three focused agents — Deployment,
Security, and Incident — each with a narrow, documented tool surface (via
MCP/tool interfaces), least-privilege credentials, and read-mostly behavior.
State-changing actions require explicit human approval.

## Consequences

- Positive: demonstrates agentic DevOps grounded in real data, not text generation.
- Positive: security boundaries are explicit and auditable per agent.
- Trade-off: requires real tool integrations (later phases) rather than a quick demo.

## Alternatives considered

- A single general chatbot — rejected; it does not interact with real platform state
  and would misrepresent the platform's capability.
