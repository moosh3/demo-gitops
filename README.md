# Install

```
kubectl apply -k ./install/
```

```
helm upgrade -i helm-operator fluxcd/helm-operator --namespace flux-system \
  --set helm.versions=v3 --set git.ssh.secretName=flux-git-deploy
```
