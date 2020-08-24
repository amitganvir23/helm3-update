# helm3-update
New Helm3 charts and new Kubernetes

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

## Apply the changes
```
helm install --namespace glt-dev hello2 . -f image.yaml
```

Usage:
  helm get [command]
Available Commands:
  all         download all information for a named release
  hooks       download all hooks for a named release
  manifest    download the manifest for a named release
  notes       download the notes for a named release
  values      download the values file for a named release

Validate the changes
```
helm -n glt-dev ls
helm -n glt-dev status hello2
helm -n glt-dev get all hello2
helm -n glt-dev get manifest hello2
helm -n glt-dev get hooks hello2
helm -n glt-dev get values hello2
```

```
helm -n glt-dev del ls
helm -n glt-dev del hello2
```