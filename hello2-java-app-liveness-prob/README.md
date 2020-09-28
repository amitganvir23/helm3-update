## Kubernetes with minikube cluster

### Liveness probe
To check container or application status based on file, command or port number status. Deployment and Pods will be failed, Incase of condition not satisifed or command not return exit code 0 then it will try to restart container multiple times based on periodSeconds/initialDelaySeconds like 5 times. Overall to just validate your container is up or not. Liveness and Readiness options are same only work will be different.

Configure Probes 
Probes have a number of fields that you can use to more precisely control the behavior of liveness and readiness checks:

initialDelaySeconds: Number of seconds after the container has started before liveness or readiness probes are initiated. Defaults to 0 seconds. Minimum value is 0.
periodSeconds: How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
timeoutSeconds: Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1.
successThreshold: Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness. Minimum value is 1.
failureThreshold: When a probe fails, Kubernetes will try failureThreshold times before giving up. Giving up in case of liveness probe means restarting the container. In case of readiness probe the Pod will be marked Unready. Defaults to 3. Minimum value is 1.

Refer link https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/

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