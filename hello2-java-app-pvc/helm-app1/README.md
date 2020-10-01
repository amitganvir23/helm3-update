What is Helm?

Helm uses a packaging format called charts. A chart is a collection of files that describe a related set of Kubernetes resources  

<hello2>/
  Chart.yaml          	# A YAML file containing information about the chart
  values.yaml         	# The default configuration values for this chart
  charts/             	# A directory containing any charts upon which this chart depends.
  templates/          	# When combined with values, will generate valid Kubernetes manifest files.
  templates/_helpers.tpl# To modify how values can access by variables.
					  
  LICENSE             # OPTIONAL: A plain text file containing the license for the chart
  README.md           # OPTIONAL: A human-readable README file
  requirements.yaml   # OPTIONAL: A YAML file listing dependencies for the chart
  templates/NOTES.txt # OPTIONAL: A plain text file containing short usage notes
  
# Download Version: https://github.com/helm/helm/releases/tag/v2.9.1

# To cehck Helm version
### $ helm version
Client: &version.Version{SemVer:"v2.9.1", GitCommit:"20adb27c7c5868466912eebdf6664e7390ebe710", GitTreeState:"clean"}
Server: &version.Version{SemVer:"v2.9.1", GitCommit:"20adb27c7c5868466912eebdf6664e7390ebe710", GitTreeState:"clean"}
##

### To cehck Helm is putting values properly in kubernetes resources.
$ helm install . --name <Chart Name> -f image.yml --debug --dry-run

## Helm helm chart deployment
$ helm package <Chart Name> --debug
$ helm install <Chart Name>-<Version>tgz --name helloworld
    ##OR
$ helm install . --name <Chart Name> -f image.yaml

## example for helm chart deployment
$ helm upgrade --install hello2 . -f image.yaml

## To list the helm charts
$ helm ls

## To Upgrade exisiting chart
$ helm upgrade --install <Chart Name> . -f image.yaml

## To get the helm charts deployment details.
$ helm get <Chart Name>

## To get the helm charts deployment status.
$ helm status <Chart Name>

## To delete the helm charts
$ helm del --purge <Chart Name>

## To check App
$ curl --silent -L 192.168.99.101:31006

## IMP NOTe:
1) Custom files: Chart.yaml, image.yaml, Values.yaml and README.md (It supports .yaml suffix)
2) Custom /templates: _helpers.tpl, deployment.yaml, service.yaml and NOTES.txt
3) Unused files can be deleted or ignore by puting values in file .helmignore

## To make custome docker image for default port number 8080:
minikube ssh "ssh-keyscan github.com >> ~/.ssh/known_hosts; \
git clone https://github.com/amitganvir23/kubernetes-minishift-openshift.git; \
cd kubernetes-minishift-openshift/kubernetes/hello-app-run/helo-app-docker-image/; \
docker build -t amitrepo/hellojava:0.0.1 ."