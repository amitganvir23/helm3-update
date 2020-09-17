kubectl -n glt-dev create configmap english-hindi --from-file=./configmapfiles/english/
kubectl -n glt-dev create configmap english-configmap --from-file=./configmapfiles/english/
kubectl -n glt-dev get configmap
kubectl -n glt-dev create -f deploy.yml -f service.yml
