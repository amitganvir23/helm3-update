namespace=glt-dev
#defaultport is 8080
## To create NameSpace
kubectl create -f ./create_namespace.yml
kubectl get namespaces

## To create hinid and english configmap
kubectl -n glt-dev create configmap hindi-configmap --from-file=./configmapfiles/hindi/
kubectl -n glt-dev create configmap english-configmap --from-file=./configmapfiles/english/
kubectl -n glt-dev get configmap

## Will Create one LoadBalancer Service and Deployment with tow pods
## 31001 port exposed
kubectl -n ${namespace} create -f deploy.yml -f service.yml
kubectl -n ${namespace} get pods

## Testing URL with nodeport
#curl http://192.168.99.100:31006/

## Check the content of configmap in a pod
kubectl -n glt-dev exec -it $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- bash
#OR
kubectl -n glt-dev exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls hindi
kubectl -n glt-dev exec $(kubectl -n ${namespace} get pods|grep hello2|awk '{print $1}') -- ls english
