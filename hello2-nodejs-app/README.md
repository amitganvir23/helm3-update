## Kubernetes with minikube cluster

Create a docker image on minikube
```
cd hello-app-docker-image
find . -type f | xargs.exe dos2unix
repo=$(pwd)
minikube.exe ssh "cd $repo; docker build . -t amitrepo/hello2nodejs:0.0.1"
```

To create NameSpace
```
kubectl create -f ./create_namespace.yml
kubectl get namespaces
```

To Apply the changes
```
kubectl -n glt-dev create -f service.yml
kubectl -n glt-dev create -f deploy.yml
```

or

```
kubectl -n glt-dev create -f deploy-service.yml
```

CHeck pod and service
```
kubectl -n ${namespace} get pods
kubectl -n ${namespace} get service

```

Testing URL with nodeport
```
#curl http://192.168.99.100:31007

```