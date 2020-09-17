# helm3-update
New Helm3 charts and new Kubernetes

## Kubernetes apply

To create NameSpace
```
kubectl create -f ./create_namespace.yml
kubectl get namespaces
```

To Apply the changes
```
kubectl -n glt-dev 
kubectl -n glt-dev get configmap
kubectl -n glt-dev create -f service.yml
kubectl -n glt-dev create -f deploy.yml
```
