#!/bin/sh
# Install Argo CD into the cluster and apply application manifest
kubectl create namespace argocd 2>/dev/null || true
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
if [ -f secrets/argocd.env ]; then
    # shellcheck disable=SC1091
    . secrets/argocd.env
    kubectl -n argocd delete secret argocd-initial-admin-secret 2>/dev/null || true
    kubectl -n argocd create secret generic argocd-initial-admin-secret --from-literal=password="$ARGOCD_ADMIN_PASSWORD"
fi
kubectl apply -f argocd/application.yaml
