# HomeServer

A simple, modular starter for running a home server on a single-node [K3s](https://k3s.io) Kubernetes cluster.

## Included services

- **K3s** – lightweight Kubernetes distribution.
- **Argo CD** – GitOps continuous delivery.
- **Traefik** – ingress controller.
- **Homepage** – dashboard inspired by [gethomepage.dev](https://gethomepage.dev).
- **AdGuard Home** – DNS and ad-blocking.
- **WireGuard** – secure remote access.
- **PostgreSQL** – external database backing Authentik.
- **Authentik** – identity provider for authentication.

## Repository structure

```
manifests/        # Kubernetes manifests for each service
config/           # Service configuration samples (AdGuard Home, WireGuard)
argocd/           # Argo CD application definition
scripts/          # Helper installation scripts
secrets/          # Local-only secrets (gitignored)
charts/           # Optional custom or third-party Helm charts
```

The `charts/` directory is empty by default and can hold any Helm charts you want to manage with this repository—either your own or third-party charts pulled from Helm repositories.

## Quick start

1. **Install K3s**
   ```bash
   scripts/install_k3s.sh
   ```

2. **Configure kubectl**
   K3s stores its kubeconfig at `/etc/rancher/k3s/k3s.yaml`. Copy it to your user directory and point `kubectl` to it:
   ```bash
   sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   export KUBECONFIG=$HOME/.kube/config
   ```

3. **Bootstrap Argo CD**
   ```bash
   scripts/bootstrap_argocd.sh
   ```

4. **Prepare secrets**
   Configure the Authentik secret key and PostgreSQL credentials, then create a Kubernetes secret:
   ```bash
   cp secrets/example.env secrets/authentik.env
   # edit secrets/authentik.env and set strong values
   kubectl create secret generic authentik-env --from-env-file=secrets/authentik.env
   ```

5. **Deploy manifests**
   - **GitOps**: Commit and push changes and let Argo CD sync.
   - **Manual**: `kubectl apply -R -f manifests/`

## Managing secrets

The `secrets/` directory is ignored by Git. Use it to store environment files or other sensitive data. A sample file is provided at `secrets/example.env`:

```
AUTHENTIK_SECRET_KEY=changeme
POSTGRES_DB=authentik
POSTGRES_USER=authentik
POSTGRES_PASSWORD=changeme
```

Use it as a template for creating your own files that can be turned into Kubernetes secrets.

## Notes

- Traefik is bundled with K3s, but manifests are provided for customization.
- Configuration examples for AdGuard Home and WireGuard are stored in `config/`.
- For production use, consider managing secrets with a dedicated secret manager (e.g., Sealed Secrets, HashiCorp Vault).
