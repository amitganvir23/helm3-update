namespace=dev
#defaultport is 8080

#============= delete
## Will delete one LoadBalancer Service and Deployment with tow pods
kubectl -n ${namespace} delete -f deploy-service-config.yml 

## To Delete NameSpace
#kubectl delete namespaces ${namespace}

