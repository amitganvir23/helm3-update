# helm3-update
New Helm3 charts and new Kubernetes

## Dockerfile
Create a docker image on minikube
```
cd CREATE-JAVA-APP-DOCKER-IMAGE
repo=$(pwd)
minikube.exe ssh "cd $repo; docker build . -t amitrepo/hello2java:0.0.1"
```



## Kubernetes apply

```
namespace=${namespace}
```

defaultport is 8080
To create NameSpace
```
kubectl create -f ./create_namespace.yml
kubectl get namespaces
```

To create hinid and english configmap
```
kubectl -n ${namespace} create configmap hindi-configmap --from-file=./configmapfiles/hindi/
kubectl -n ${namespace} create configmap english-configmap --from-file=./configmapfiles/english/
kubectl -n ${namespace} get configmap
```

## Will Create one LoadBalancer Service and Deployment with tow pods
```
kubectl -n ${namespace} create -f deploy.yml -f service.yml
kubectl -n ${namespace} get pods
```

Testing URL with nodeport
```
curl http://192.168.99.100:31006/
```

Check the content of configmap in a pod
```
kubectl -n ${namespace} exec -it $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- bash
#OR
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls hindi
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls english
```

