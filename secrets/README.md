# Secrets
Place sensitive configuration files or environment variables in this directory.
They are ignored by Git.

Example:

```bash
cp example.env authentik.env
kubectl create secret generic authentik-env --from-env-file=authentik.env
```

The sample `.env` includes Authentik's secret key, bootstrap superuser, and PostgreSQL credentials. Replace all placeholder values before creating the Kubernetes secret. Use a secure secret manager for production environments.
