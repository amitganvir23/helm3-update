kubectl -n glt-dev create configmap hindi-configmap --from-file=./configmapfiles/hindi/
kubectl -n glt-dev create configmap english-configmap --from-file=./configmapfiles/english/
kubectl -n glt-dev get configmap
kubectl -n glt-dev create -f deploy.yml -f service.yml
