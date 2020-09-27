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

To create NameSpace
```
kubectl create -f ./create_namespace.yml
kubectl get namespaces
```

```
export namespace=${namespace}
```

## nfs provisioner refrence
https://github.com/helm/charts/tree/master/stable/nfs-client-provisioner
https://github.com/helm/charts.git
Share a directroy from NFS so that we can access it from the pods
create nfs server and for minikue you can refere this file "create-nfs-server.sh"
After NFS server run nfs nfs-client-provisioner
```
git clone git clone https://github.com/helm/charts.git
helm -n ${namespace} install nfs-client-provisioner -f values-nfs-client.yaml charts/stable/nfs-client-provisioner/
```
OR
Alrady copied nfs-client-provisioner from above repo so we can skip above step
```
helm -n ${namespace} install nfs-client-provisioner -f values-nfs-client.yaml nfs-client-provisioner
```

```
helm -n ${namespace} ls
kubectl -n ${namespace} get pod
```

To create PV and PVC using NFS
```
kubectl -n ${namespace} create -f pvc-nfs-server.yml
kubectl -n ${namespace} get pvc
kubectl -n ${namespace} get pv
```

To Apply the changes
```
kubectl -n ${namespace} create -f deploy-pod1.yml -f deploy-pod1.yml -f service.yml
kubectl -n ${namespace} get pods
```

Check the content of shared NFS volume in a pod
```
kubectl -n ${namespace} exec -it $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- bash
#OR
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- df -h
kubectl -n ${namespace} exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls /data
```
