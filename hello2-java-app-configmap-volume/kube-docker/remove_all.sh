namespace=glt-dev
#defaultport is 8080

#============= delete
## Will delete one LoadBalancer Service and Deployment with tow pods
kubectl -n ${namespace} delete -f deploy.yml -f service.yml

## To delelte configmap
kubectl -n ${namespace} delete configmap hindi-configmap  english-configmap

## To Delete NameSpace
kubectl delete namespaces ${namespace}

