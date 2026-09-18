You are the lead platform engineer responsible for setting up a new production-quality GitHub repository called:

agentic-ai-orchestration

Repository:
github.com/muhammed-ai/agentic-ai-orchestration

This is a portfolio-grade engineering project designed to demonstrate Senior DevOps / Platform Engineering capabilities.

The goal is to build an AI-Native Internal Developer Platform (IDP) that demonstrates:

* Platform Engineering
* Internal Developer Portals
* Developer self-service
* Infrastructure as Code
* Kubernetes
* CI/CD
* GitOps
* DevSecOps
* Software supply-chain security
* Cloud security
* Observability
* Multi-cloud architecture
* AI-assisted/agentic DevOps automation

The project should look and behave like a realistic internal engineering platform rather than a toy AI demo.

IMPORTANT:
Do NOT start implementing the entire platform yet.

Your first task is to establish the repository foundation, architecture, engineering standards, documentation structure, and development plan.

==================================================

1. PROJECT PRINCIPLES
    ==================================================

Design the project using these principles:

1. Production-quality engineering practices.
2. Infrastructure should be reproducible.
3. Everything possible should be automated.
4. Security should be built into the platform rather than added later.
5. Developers should consume the platform through self-service workflows.
6. AI agents should interact with real platform data and tooling rather than simply generating text.
7. Azure should be the primary cloud.
8. AWS should demonstrate secondary cloud capability.
9. GCP should demonstrate foundational multi-cloud capability.
10. Kubernetes should be a core deployment platform.
11. GitHub Actions should be the primary CI/CD system.
12. Argo CD should represent GitOps-based continuous delivery.
13. Backstage should represent the Internal Developer Portal.
14. Terraform should be the primary Infrastructure-as-Code technology.
15. The architecture should be understandable to recruiters and senior engineers reviewing the repository.

==================================================
2. TARGET ARCHITECTURE

Use this conceptual architecture:

Developer
|
v
Backstage Developer Portal
|
+—————————–+
|                             |
v                             v
GitHub Repository          Platform Services
|                             |
v                             v
GitHub Actions             Terraform
|                             |
+————+––––––––+
|
v
Security Gates
|
+———+———+
|         |         |
SAST      SCA       SBOM
|         |         |
+———+———+
|
v
Container Scan
|
v
Container Registry
|
v
Argo CD
|
v
Kubernetes
+––––+––––+
|        |        |
AKS      EKS      GKE
|
v
Observability
Prometheus / Grafana / OpenTelemetry

AI / Agentic Layer
|
+– Deployment Agent
+– Security Agent
+– Incident Agent

The architecture should remain modular so individual components can be developed and tested independently.

==================================================
3. CLOUD STRATEGY

Azure:

Primary cloud environment.

Target technologies:

* AKS
* Azure Container Registry
* Azure Key Vault
* Azure Monitor where appropriate
* Azure networking
* Managed identities
* RBAC
* Terraform

AWS:

Secondary cloud demonstrating portability and multi-cloud architecture.

Target technologies:

* EKS
* ECR
* IAM
* VPC
* Secrets management
* Terraform

GCP:

Keep the initial implementation intentionally lightweight.

Target technologies:

* GKE
* Artifact Registry
* IAM
* VPC
* Secret Manager
* Terraform

Do not create unnecessary cloud infrastructure simply for the sake of demonstrating three clouds.

Use modular Terraform architecture so cloud-specific implementations remain isolated.

==================================================
4. REPOSITORY STRUCTURE

Create an initial repository structure similar to:

agentic-ai-orchestration/

├── README.md
├── LICENSE
├── .gitignore
├── .editorconfig
│
├── docs/
│   ├── architecture.md
│   ├── platform-design.md
│   ├── security.md
│   ├── developer-guide.md
│   ├── incident-response.md
│   ├── disaster-recovery.md
│   ├── decisions/
│   │   └── README.md
│   └── diagrams/
│
├── terraform/
│   ├── modules/
│   ├── azure/
│   ├── aws/
│   └── gcp/
│
├── kubernetes/
│   ├── base/
│   ├── overlays/
│   └── applications/
│
├── argocd/
│   ├── applications/
│   └── projects/
│
├── platform/
│   └── backstage/
│
├── agents/
│   ├── deployment-agent/
│   ├── security-agent/
│   └── incident-agent/
│
├── security/
│   ├── policies/
│   ├── sbom/
│   ├── scanning/
│   └── signing/
│
├── .github/
│   ├── workflows/
│   ├── CODEOWNERS
│   └── dependabot.yml
│
├── services/
│   └── sample-api/
│
├── scripts/
│
└── tests/

You may adjust the structure if you identify a better professional architecture, but document the reason for any significant deviation.

==================================================
5. DOCUMENTATION FIRST

Before implementing infrastructure, create initial documentation describing:

A. Business problem

Explain the problem this platform solves:

Developers should not need to understand every underlying cloud, Kubernetes, networking, security, CI/CD, and observability implementation detail to deploy a production-ready service.

B. Target users

* Application developers
* Platform engineers
* DevOps engineers
* Security engineers
* SREs

C. Platform capabilities

Document the intended capabilities:

* Self-service application creation
* Infrastructure provisioning
* CI/CD
* GitOps
* Security validation
* SBOM generation
* Container security
* Secrets management
* Observability
* Incident diagnostics
* AI-assisted operational workflows

D. Architecture

Document how all major components interact.

E. Security model

Document the planned security controls and trust boundaries.

F. Developer experience

Describe the intended developer workflow from:

Create service
→ Provision infrastructure
→ Commit code
→ CI security checks
→ Build image
→ Push image
→ GitOps deployment
→ Observe service
→ Diagnose incidents

==================================================
6. ENGINEERING STANDARDS

Establish repository standards for:

* Branching
* Pull requests
* CODEOWNERS
* Commit messages
* Terraform formatting
* Terraform validation
* Kubernetes manifest validation
* YAML linting
* Python formatting/linting
* Security scanning
* Secret detection
* Documentation
* Testing

Create appropriate configuration files where useful.

Do not over-engineer the standards at this stage.

==================================================
7. CI/CD FOUNDATION

Create the initial GitHub Actions workflow structure.

Do NOT implement every pipeline yet.

Create placeholders/frameworks for:

* Terraform validation
* Terraform security scanning
* Application build/test
* Container build
* Container scanning
* SBOM generation
* Kubernetes validation
* Security checks

The workflows should be modular enough to evolve as the project grows.

==================================================
8. SECURITY / SUPPLY CHAIN

The final platform will demonstrate software supply-chain security.

Design the initial structure to support:

* SAST
* Software Composition Analysis
* Secret detection
* SBOM generation
* Container image scanning
* Infrastructure security scanning
* Kubernetes security validation
* Artifact signing
* Artifact verification
* Dependency management

Potential technologies may include:

* GitHub CodeQL
* Dependabot
* Trivy
* Syft
* Cosign
* Checkov
* OPA / Kyverno

Do not install or configure everything yet.

Document the intended security architecture and identify what will be implemented in each phase.

==================================================
9. BACKSTAGE

Backstage represents the Internal Developer Portal.

The eventual portal should allow a developer to:

* Discover services
* Create a new service from a template
* View ownership
* View documentation
* Access CI/CD
* Access deployments
* Access Kubernetes information
* Access observability
* Access security information

For now:

Create the platform/backstage structure and document the intended integration architecture.

Do not spend time building a polished UI yet.

==================================================
10. AI AGENT ARCHITECTURE

AI must be treated as an engineering component, not a chatbot.

Plan three initial agents:

Deployment Agent:

* Analyze failed GitHub Actions workflows
* Analyze Argo CD deployment state
* Analyze Kubernetes events
* Analyze pod status/logs
* Identify likely root cause
* Recommend remediation

Security Agent:

* Analyze SAST results
* Analyze dependency vulnerabilities
* Analyze container scan results
* Analyze SBOM
* Analyze infrastructure security findings
* Produce a security assessment

Incident Agent:

* Analyze metrics
* Analyze logs
* Analyze alerts
* Correlate operational signals
* Produce incident summaries
* Suggest investigation steps

The agents should eventually use controlled tools/MCP interfaces to access real platform information.

Do not implement the agents yet.

Document their interfaces, responsibilities, permissions, and security boundaries.

==================================================
11. LOCAL DEVELOPMENT

The project must be usable from a developer workstation without requiring the entire multi-cloud infrastructure to be deployed.

Design a local development strategy using appropriate tools such as:

* Docker
* Kind or Minikube
* Local Kubernetes
* Terraform validation
* Local CI validation where appropriate

Cloud deployments should be optional and controlled.

Avoid designs that require expensive cloud resources merely to run the project locally.

==================================================
12. COST CONTROL

This is a portfolio project.

Design with cost awareness.

Document:

* Which infrastructure can be local
* Which cloud components are optional
* Which resources should be destroyed after demonstrations
* How to avoid unnecessary always-on cloud resources

Do not create expensive infrastructure automatically.

==================================================
13. ARCHITECTURE DECISION RECORDS

Create an ADR framework under:

docs/decisions/

Create initial ADRs for major architectural decisions such as:

* Why Backstage
* Why Terraform
* Why Kubernetes
* Why Argo CD
* Why GitHub Actions
* Why Azure as the primary cloud
* Why AI agents instead of a generic chatbot

Keep ADRs concise and technical.

==================================================
14. README

Create an initial professional README that explains:

* What the project is
* Why it exists
* Architecture
* Key capabilities
* Technology stack
* Development roadmap
* Security approach
* AI architecture
* Local development
* Future capabilities

Do not claim capabilities that have not yet been implemented.

Clearly distinguish:

IMPLEMENTED
PLANNED
EXPERIMENTAL

This distinction is extremely important because this repository will be used as a professional portfolio.

==================================================
15. ROADMAP

Create a phased implementation roadmap.

Suggested phases:

Phase 1:
Repository + architecture + local development

Phase 2:
Terraform + cloud foundation

Phase 3:
Kubernetes platform

Phase 4:
GitHub Actions CI/CD

Phase 5:
DevSecOps / supply-chain security

Phase 6:
Argo CD / GitOps

Phase 7:
Backstage Developer Portal

Phase 8:
Observability

Phase 9:
AI Deployment Agent

Phase 10:
AI Security Agent

Phase 11:
AI Incident Agent

Phase 12:
Multi-cloud expansion

Phase 13:
Platform hardening and documentation

You may modify the sequence if technical dependencies require it.

==================================================
16. IMPORTANT DEVELOPMENT RULES

Do NOT:

* Generate fake production results.
* Claim infrastructure exists when it doesn’t.
* Add fake screenshots.
* Add fake performance metrics.
* Claim GCP/AWS capabilities that have not been implemented.
* Claim security controls that have not been implemented.
* Build a superficial chatbot and call it an AI platform.
* Hardcode credentials.
* Commit secrets.
* Create expensive cloud resources without explicit instructions.

DO:

* Explain architectural decisions.
* Use production-quality naming.
* Prefer reusable modules.
* Keep components loosely coupled.
* Make security a first-class concern.
* Make the developer experience measurable.
* Document implementation status.
* Write code that could realistically evolve into an internal platform.

==================================================
17. FIRST EXECUTION TASK

For this first task, ONLY do the following:

1. Inspect the current repository.
2. Determine what already exists.
3. Do not destroy existing work.
4. Create the new directory structure.
5. Create the initial documentation.
6. Create the initial README.
7. Create the ADR framework and initial ADRs.
8. Create repository engineering standards.
9. Create the initial GitHub Actions workflow structure.
10. Create placeholders for Terraform, Kubernetes, Backstage, security, and agents.
11. Create the implementation roadmap.
12. Validate the repository structure.
13. Run basic local validation where possible.
14. Provide a concise implementation report.

Do NOT deploy Azure, AWS, or GCP infrastructure yet.

Do NOT create expensive resources.

Do NOT implement the full platform yet.

At the end, report:

* Files created
* Files modified
* Architecture decisions made
* Current implementation status
* Validation performed
* Remaining work
* Recommended next implementation step

Treat this repository as if it were being reviewed by a Staff/Principal Platform Engineer during a technical interview.
