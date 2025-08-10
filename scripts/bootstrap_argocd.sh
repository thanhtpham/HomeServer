#!/bin/sh
# Install Argo CD into the cluster and apply application manifest
kubectl create namespace argocd 2>/dev/null || true
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f argocd/application.yaml
