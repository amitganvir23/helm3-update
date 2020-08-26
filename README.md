# helm3-update
New Helm3 charts and new Kubernetes

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
