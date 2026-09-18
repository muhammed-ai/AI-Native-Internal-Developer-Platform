# Disaster recovery

> Status: **PLANNED**. Describes intended DR posture for a portfolio-grade platform.

## 1. Philosophy

Because the platform is defined as code (Terraform) and delivered via GitOps
(Argo CD), recovery is primarily a matter of **re-applying declarative state** to
fresh infrastructure rather than restoring imperative snapshots.

## 2. What is the source of truth

| Concern | Source of truth | Recovery method |
| --- | --- | --- |
| Cloud infrastructure | Terraform code + remote state | `terraform apply` to a new environment |
| Cluster workloads | Git (manifests + Argo CD apps) | Argo CD re-syncs from Git |
| Application images | Container registry | Rebuild from source if lost |
| Secrets | Cloud vaults (Key Vault / Secrets Manager / Secret Manager) | Restore from vault backup / re-provision |
| Observability config | Git | Re-apply |

## 3. Objectives (targets, to be validated per environment)

- **RPO** (data loss tolerance): defined per stateful service; stateless services = 0.
- **RTO** (time to restore): dominated by cloud provisioning + image pull time.

These are targets to be measured once environments exist — not measured results.

## 4. Terraform state

- Remote, versioned, and locked backend (e.g. Azure Storage + state locking).
- State is never committed to Git. `.gitignore` blocks `*.tfstate`.

## 5. Multi-cloud posture

Azure is primary. AWS demonstrates portability; GCP is foundational. DR does not
require all three to be live simultaneously — the modular Terraform layout allows
standing up an alternate cloud from code if needed.

## 6. Backups

- Cloud-managed backups for stateful data stores where used.
- Vault backups for secrets.
- Git and the container registry are the durable record for everything else.

## 7. Not yet implemented

No DR automation exists at the foundation stage. This is the design target for
later phases (see the roadmap in the README).
