## Kubernetes with minikube cluster

### Liveness probe
To check container or application status based on file, command or port number status. Deployment and Pods will be failed, Incase of condition not satisifed or command not return exit code 0 then it will try to restart container multiple times based on periodSeconds/initialDelaySeconds like 5 times. Overall to just validate your container is up or not.

## Dockerfile
Create a docker image on minikube
```
cd CREATE-JAVA-APP-DOCKER-IMAGE
repo=$(pwd)
minikube.exe ssh "cd $repo; docker build . -t amitrepo/hello2java:0.0.1"
```

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

CHeck pod and service
```
kubectl -n ${namespace} get pods
kubectl -n ${namespace} get service

```

To Check Liveness probe and pod logs
```
kubectl -n ${namespace} get pods
kubectl -n ${namespace} describe pod hello-app-66557b4d7b-84qzm
```

Testing URL with nodeport
```
#curl http://192.168.99.100:31008

```