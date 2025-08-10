# Secrets
Place sensitive configuration files or environment variables in this directory.
They are ignored by Git.

Example:

```bash
cp example.env authentik.env
kubectl create secret generic authentik-env --from-env-file=authentik.env
```

Use a secure secret manager for production environments.
