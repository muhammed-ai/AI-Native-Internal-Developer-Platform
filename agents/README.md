# AI / Agentic layer

> Status: **PLANNED**. This documents agent interfaces, responsibilities,
> permissions, and security boundaries. **No agent is implemented yet.**

AI is treated as an engineering component, not a chatbot
(see [ADR 0007](../docs/decisions/0007-ai-agents-not-chatbot.md)). Each agent reads
**real** platform signals through controlled tools (MCP/tool interfaces), operates
under least privilege, and requires human approval for any state-changing action.

## Agents

| Agent | Reads | Produces | Can mutate state? |
| --- | --- | --- | --- |
| [Deployment](deployment-agent/) | GitHub Actions runs, Argo CD state, K8s events, pod status/logs | Root-cause hypothesis + remediation suggestions | No (suggests only) |
| [Security](security-agent/) | SAST, SCA, container scan, SBOM, IaC findings | Security assessment | No |
| [Incident](incident-agent/) | Metrics, logs, alerts, recent deploys | Incident summary + investigation steps | No |

## Shared security boundaries

1. **Read-mostly.** Agents observe and reason. Any action is a *suggestion* a human executes.
2. **Least privilege.** Each agent has its own scoped credential; no shared token.
3. **Narrow tool surface.** Only the specific, documented tools per agent — nothing broad.
4. **Untrusted inputs.** Logs, scan output, and model responses are treated as untrusted.
5. **Auditable.** Every tool call is logged with inputs and the requesting agent.
6. **No secrets to the model.** Secret values are never placed in prompts.

## Tool interface (planned)

Agents will access platform data through an MCP-style tool layer that wraps the
GitHub, Argo CD, Kubernetes, and observability APIs with read-scoped credentials.
The tool layer — not the model — enforces permissions.
