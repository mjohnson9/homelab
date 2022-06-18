#!/bin/sh

set -e

helm template \
    --include-crds \
    --namespace argocd \
    --set 'argo-cd.server.metrics.serviceMonitor.enabled=false' \
    --set 'argo-cd.controller.metrics.serviceMonitor.enabled=false' \
    --set 'argo-cd.repoServer.metrics.serviceMonitor.enabled=false' \
    --set 'argo-cd.redis.metrics.serviceMonitor.enabled=false' \
    argocd . \
    | kubectl apply -n argocd -f -

kubectl -n argocd wait --timeout=60s --for condition=Established \
       crd/applications.argoproj.io \
       crd/applicationsets.argoproj.io
