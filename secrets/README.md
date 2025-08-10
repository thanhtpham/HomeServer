# Secrets
Place sensitive configuration files or environment variables in this directory.
They are ignored by Git.

Examples:

```bash
# Authentik and PostgreSQL
cp example.env authentik.env
kubectl create secret generic authentik-env --from-env-file=authentik.env

# Argo CD admin password
cp example.env argocd.env
# keep only ARGOCD_ADMIN_PASSWORD
# bootstrap_argocd.sh reads this file when setting the password
```

The sample `.env` includes Authentik's secret key, bootstrap superuser, PostgreSQL connection details (host, port, database, user, password), and an Argo CD admin password. Replace all placeholder values before creating Kubernetes secrets. Use a secure secret manager for production environments.
