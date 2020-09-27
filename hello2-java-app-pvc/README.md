# helm3-update
New Helm3 charts and new Kubernetes

```
cd helm
helm.exe upgrade -n ${namespace --install model . -f image.yaml
#OR
helm.exe install-n ${namespace model . -f image.yaml
```
OR
```
cd helm-job
helm.exe upgrade -n ${namespace --install model2 . -f image.yaml
#OR
helm.exe install -n ${namespace model2 . -f image.yaml
```

```
helm -n ${namespace ls
kubectl -n ${namespace} get pods
```

## Dockerfile
user docker file from hello2-java-app directory

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
