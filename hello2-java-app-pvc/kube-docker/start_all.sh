namespace=glt-dev
#defaultport is 8080
## To create NameSpace
kubectl create -f ./create_namespace.yml
kubectl get namespaces

## To create PVC and cliam for PV.
kubectl -n glt-dev create -f pvc.yml
kubectl -n glt-dev get pv
kubectl -n glt-dev get pvc

## Will Create one LoadBalancer Service and Deployment with tow pods
## 31001 port exposed
kubectl -n ${namespace} create -f -f deploy-pod1.yml -f deploy-pod2.yml -f service.yml
kubectl -n ${namespace} get pods

## Testing URL with nodeport
#curl http://192.168.99.100:31006/

## Check the content of shared NFS volume in a pod
kubectl -n glt-dev exec -it $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- bash
#OR
kubectl -n glt-dev exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- df -h
kubectl -n glt-dev exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls /data
