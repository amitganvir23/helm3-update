namespace=glt-dev
#defaultport is 8080
## To create NameSpace
kubectl create -f ./create_namespace.yml
kubectl get namespaces

## Will Create one LoadBalancer Service and Deployment with tow pods
## 31007 port exposed
kubectl -n ${namespace} create -f deploy.yml -f service.yml
OR
kubectl -n ${namespace} create -f deploy-service.yml

## CHeck pod and service
kubectl -n ${namespace} get pods
kubectl -n ${namespace} get service

## Testing URL with nodeport
#curl http://192.168.99.100:31007

