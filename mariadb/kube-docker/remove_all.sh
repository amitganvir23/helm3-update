#============= delete
namespace=glt-dev
## Will delete one LoadBalancer Service and Deployment with tow pods
kubectl -n ${namespace} delete -f deploy-service.yml 

## To Delete NameSpace
kubectl delete namespaces ${namespace}

