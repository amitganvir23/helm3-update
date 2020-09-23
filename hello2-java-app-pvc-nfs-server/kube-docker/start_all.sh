namespace=${namespace}
#defaultport is 8080
## To create NameSpace
kubectl create -f ./create_namespace.yml
kubectl get namespaces

## nfs provisioner refrence
https://github.com/helm/charts/tree/master/stable/nfs-client-provisioner
https://github.com/helm/charts.git

## Share a directroy from NFS so that we can access it from the pods
create nfs server and for minikue you can refere this file "create-nfs-server.sh"

## After NFS server run nfs nfs-client-provisioner
git clone git clone https://github.com/helm/charts.git
helm -n ${namespace} install nfs-client-provisioner -f values-nfs-client.yaml charts/stable/nfs-client-provisioner/
helm -n ${namespace} ls
kubectl -n ${namespace} get pod

## To create PV and PVC using NFS
kubectl -n ${namespace} create -f pvc-nfs-server.yml
kubectl -n ${namespace} get pvc
kubectl -n ${namespace} get pv

## Will Create one LoadBalancer Service and Deployment with tow pods
## 31001 port exposed
kubectl -n ${namespace} create -f deploy-pod1.yml -f deploy-pod1.yml -f service.yml
kubectl -n ${namespace} get pods

## Testing URL with nodeport
#curl http://192.168.99.100:31006/

## Check the content of shared NFS volume in a pod
kubectl -n ${namespace} exec -it $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- bash
#OR
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- df -h
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls /data
