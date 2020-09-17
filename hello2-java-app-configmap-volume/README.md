# helm3-update
New Helm3 charts and new Kubernetes

## Dockerfile
user docker file from hello2-java-app directory

## Kubernetes apply

To create NameSpace
```
kubectl create -f ./create_namespace.yml
kubectl get namespaces
```

To Apply the changes
```
kubectl -n glt-dev create configmap hindi-configmap --from-file=./configmapfiles/hindi/
kubectl -n glt-dev create configmap english-configmap --from-file=./configmapfiles/english/
kubectl -n glt-dev get configmap
kubectl -n glt-dev create -f deploy.yml -f service.yml
```
