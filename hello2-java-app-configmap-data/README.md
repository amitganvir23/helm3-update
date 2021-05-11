# helm3-update
New Helm3 charts and new Kubernetes

## Dockerfile
Follow below steps to create docker image on minikube machine
```
cd CREATE-JAVA-APP-DOCKER-IMAGE
dos2unix *
```

for root user
```
repo=$(pwd)
minikube ssh "cd $repo; docker build . -t amitrepo/hello2java:0.0.1"
```

for non-root user
```
repo=$(pwd)
repo=$(echo $repo|sed 's/home/hosthome/')
minikube ssh "cd $repo; docker build . -t amitrepo/hello2java:0.0.1"
```



## Kubernetes apply

```
namespace="dev"
```

defaultport is 8080
To create NameSpace
```
kubectl create -f ./create_namespace.yml
kubectl get ns

```

## Will Create one LoadBalancer Service and Deployment with configmap. Configamp will automatically update in pod
```
kubectl -n ${namespace} create -f deploy-service-config.yml
kubectl -n ${namespace} get pods
kubectl -n ${namespace} get svc
kubectl -n ${namespace} get cm
```

Testing URL with nodeport
```
curl http://192.168.99.100:31006/
```

Check the content of configmap in a pod
```
kubectl -n ${namespace} exec -it $(kubectl get po|grep -w assets|awk '{print $1}') -- cat config/application.yml
```

