# helm3-update
New Helm3 charts and new Kubernetes


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

To Apply the changes
```
kubectl -n glt-dev create -f service.yml
kubectl -n glt-dev create -f deploy.yml
```

or

```
kubectl -n glt-dev create -f deploy-service.yml
```

## Helm Charts apply

Helm charts dry run
```
helm install -n glt-dev hello2 . -f image.yaml --dry-run --debug
```

## Apply the changes
```
helm install --namespace glt-dev hello2 . -f image.yaml
```
Validate the helm charts changes
```
helm -n glt-dev ls
helm -n glt-dev status hello2
helm -n glt-dev get all hello2
helm -n glt-dev get manifest hello2
helm -n glt-dev get hooks hello2
helm -n glt-dev get values hello2
```
To delete helm charts
```
helm -n glt-dev ls
helm -n glt-dev del hello2
```
