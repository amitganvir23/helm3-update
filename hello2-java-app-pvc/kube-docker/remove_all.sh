namespace=glt-dev
#defaultport is 8080

#============= delete
## Will delete one LoadBalancer Service, Deployment and pvc.
kubectl -n ${namespace} delete -f deploy-pod1.yml -f deploy-pod2.yml -f service.yml -f pvc.yml

## To Delete NameSpace
kubectl delete namespaces ${namespace}

