namespace=dev
#defaultport is 8080
## To create NameSpace
kubectl create -f ./create_namespace.yml
kubectl get ns


## Will Create one LoadBalancer Service and Deployment with tow pods
## 31001 port exposed
## List pods, service and configmap
kubectl -n ${namespace} create -f deploy-service-config.yml
kubectl -n ${namespace} get pods
kubectl -n ${namespace} get svc
kubectl -n ${namespace} get cm

## Testing URL with nodeport
#curl http://192.168.99.100:31006/

## Check the content of configmap in a pod
kubectl -n ${namespace} exec -it $(kubectl get po|grep -w assets|awk '{print $1}') -- cat config/application.yml
