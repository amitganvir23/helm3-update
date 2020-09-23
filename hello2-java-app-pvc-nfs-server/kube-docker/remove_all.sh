namespace=glt-dev
#defaultport is 8080

#============= delete
## Will delete one LoadBalancer Service and Deployment with tow pods
kubectl -n ${namespace} delete -f deploy-pod1.yml -f deploy-pod1.yml -f service.yml -f pvc-nfs-server.yml

## To delelte configmap
helm -n ${namespace} delete nfs-client-provisioner

## To Delete NameSpace
kubectl delete namespaces ${namespace}

