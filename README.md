# HomeServer

This repository provides a modular setup for running a home server on top of a K3s Kubernetes cluster. It includes manifests and configuration for:

- **K3s** – lightweight Kubernetes distribution.
- **Argo CD** – GitOps continuous delivery.
- **Traefik** – ingress controller.
- **Homepage** – dashboard inspired by [gethomepage.dev](https://gethomepage.dev).
- **AdGuard Home** – DNS and ad-blocking.
- **WireGuard** – secure remote access.

## Repository Structure

```
manifests/        # Kubernetes manifests for each service
argocd/           # Argo CD application definition
scripts/          # Helper installation scripts
charts/           # Helm charts
config/           # Service configuration (AdGuard Home, WireGuard)
secrets/          # Placeholder directory for secrets (gitignored)
```

## Getting Started

1. **Install K3s**
   ```bash
   scripts/install_k3s.sh
   ```

2. **Configure kubectl**
   Ensure your kubeconfig points to the new K3s cluster.

3. **Bootstrap Argo CD**
   ```bash
   scripts/bootstrap_argocd.sh
   ```

4. **Review Manifests**
   Customize files under `manifests/` and configuration under `config/` before applying them.

5. **Manage Secrets**
   Place sensitive files or environment variables inside the `secrets/` directory. This folder is ignored by Git to prevent accidental commits.

## Notes

- Traefik is bundled with K3s, but manifests are provided for customization.
- WireGuard and AdGuard Home configuration examples are stored in `config/` and should be adjusted for your environment.
- For production use, consider managing secrets with a dedicated secret manager (e.g., Sealed Secrets, HashiCorp Vault).

