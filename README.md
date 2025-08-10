# HomeServer

A simple, modular starter for running a home server on a single-node [K3s](https://k3s.io) Kubernetes cluster.

## Included services

- **K3s** – lightweight Kubernetes distribution.
- **Argo CD** – GitOps continuous delivery.
- **Traefik** – ingress controller.
- **Homepage** – dashboard inspired by [gethomepage.dev](https://gethomepage.dev).
- **AdGuard Home** – DNS and ad-blocking.
- **WireGuard** – secure remote access.
- **Authentik** – identity provider for authentication.

## Repository structure

```
manifests/        # Kubernetes manifests for each service
config/           # Service configuration samples (AdGuard Home, WireGuard)
argocd/           # Argo CD application definition
scripts/          # Helper installation scripts
secrets/          # Local-only secrets (gitignored)
charts/           # Optional Helm charts
```

## Quick start

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

4. **Prepare secrets**
   ```bash
   cp secrets/example.env secrets/authentik.env
   kubectl create secret generic authentik-env --from-env-file=secrets/authentik.env
   ```

5. **Deploy manifests**
   - **GitOps**: Commit and push changes and let Argo CD sync.
   - **Manual**: `kubectl apply -R -f manifests/`

## Managing secrets

The `secrets/` directory is ignored by Git. Use it to store environment files or other sensitive data. A sample file is provided at `secrets/example.env`:

```
AUTHENTIK_SECRET_KEY=changeme
POSTGRES_PASSWORD=changeme
```

Use it as a template for creating your own files that can be turned into Kubernetes secrets.

## Notes

- Traefik is bundled with K3s, but manifests are provided for customization.
- Configuration examples for AdGuard Home and WireGuard are stored in `config/`.
- For production use, consider managing secrets with a dedicated secret manager (e.g., Sealed Secrets, HashiCorp Vault).
