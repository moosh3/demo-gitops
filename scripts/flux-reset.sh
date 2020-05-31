#!/usr/bin/env bash

set -e

if [[ ! -x "$(command -v kubectl)" ]]; then
    echo "kubectl not found"
    exit 1
fi

if [[ ! -x "$(command -v helm)" ]]; then
    echo "helm not found"
    exit 1
fi

helm -n flux delete flux || true
kubectl -n istio-system delete istiooperators.install.istio.io --all || true
helm -n flux delete helm-operator || true
helm -n istio-system delete flagger || true
helm -n istio-system delete flagger-grafana || true
kubectl delete ns istio-system || true
kubectl delete ns istio-operator || true
kubectl delete ns flux || true
