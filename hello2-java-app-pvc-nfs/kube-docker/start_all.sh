namespace=${namespace}
#defaultport is 8080
## To create NameSpace
kubectl create -f ./create_namespace.yml
kubectl get namespaces

## Share a directroy from NFS so that we can access it from the pods

## To create PV and PVC using NFS
kubectl -n ${namespace} create -f pv.yml -f pvc.yml
kubectl -n ${namespace} get configmap

## Will Create one LoadBalancer Service and Deployment with tow pods
## 31001 port exposed
kubectl -n ${namespace} create -f deploy-nfs1.yml -f service.yml
kubectl -n ${namespace} get pods

## Testing URL with nodeport
#curl http://192.168.99.100:31006/

## Check the content of shared NFS volume in a pod
kubectl -n ${namespace} exec -it $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- bash
#OR
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- df -h
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls /data
