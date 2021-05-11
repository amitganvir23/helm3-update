# helm3-update
New Helm3 charts and new Kubernetes


Follow below steps to create docker image on minikube machine ####
```
cd CREATE-JAVA-APP-DOCKER-IMAGE
dos2unix *
```

for root user
```
repo=$(pwd)
minikube ssh "cd $repo; docker build . -t amitrepo/hello2java:0.0.1"
```

for non-root user
```
repo=$(pwd)
repo=$(echo $repo|sed 's/home/hosthome/')
minikube ssh "cd $repo; docker build . -t amitrepo/hello2java:0.0.1"
```

## Kubernetes apply

To create NameSpace
```
kubectl create -f ./create_namespace.yml
kubectl get namespaces
```

To Apply the changes
```
kubectl -n ${namespace} create -f service.yml
kubectl -n ${namespace} create -f deploy.yml
```

or

```
kubectl -n ${namespace} create -f deploy-service.yml
```

## Helm Charts apply
```
namespace="glt-dev"
```
Helm charts dry run
helm install -n <NameSpace> <Chart Name> . -f image.yaml --dry-run --debug
```
helm install -n ${namespace} hello2 . -f image.yaml --dry-run --debug
```

## Apply the changes
```
helm install --namespace ${namespace} hello2 . -f image.yaml
```
Validate the helm charts changes
helm install -n <NameSpace> <CMD> <Chart Name> 
```
helm -n ${namespace} ls
helm -n ${namespace} status hello2
helm -n ${namespace} get all hello2
helm -n ${namespace} get manifest hello2
helm -n ${namespace} get hooks hello2
helm -n ${namespace} get values hello2
```
To delete helm charts
```
helm -n ${namespace} ls
helm -n ${namespace} del hello2
```
Note:- 'default' is the Default namespace for Helm/kubectl.
