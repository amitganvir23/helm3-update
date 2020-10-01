# helm3-update
New Helm3 charts and new Kubernetes. Shared same PVC from app1 to app2. Bothe app will going to use same PVC.
```
cd helm-app1
helm.exe upgrade -n ${namespace} --install app1 . -f image.yaml
#OR
helm.exe install -n ${namespace} app1 . -f image.yaml

cd helm-app2
helm.exe upgrade -n ${namespace} --install app2 . -f image.yaml
#OR
helm.exe install -n ${namespace} app2 . -f image.yaml
```
OR
```
cd helm-job
helm.exe upgrade -n ${namespace} --install app3 . -f image.yaml
#OR
helm.exe install -n ${namespace} app3 . -f image.yaml
```

```
helm -n ${namespace ls
kubectl -n ${namespace} get pods
```

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

To create PVC and cliam for PV.
```
kubectl -n ${namespace} create -f pvc.yml
kubectl -n ${namespace} get pv
kubectl -n ${namespace} get pvc
```

Will Create one LoadBalancer Service and Deployment with tow pods
```
kubectl -n ${namespace} create -f -f deploy-pod1.yml -f deploy-pod2.yml -f service.yml
kubectl -n ${namespace} get pods
```

## Testing URL with nodeport
```
curl http://192.168.99.100:31006/
```

Check the content of shared NFS volume in a pod
```
kubectl -n ${namespace} exec -it $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- bash
#OR
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- df -h
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls /data
```
