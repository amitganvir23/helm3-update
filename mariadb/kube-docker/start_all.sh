namespace=glt-dev
#defaultport is 3306
## To create NameSpace
kubectl create -f ./create_namespace.yml
kubectl get namespaces

## Will Create one LoadBalancer Service and Deployment with tow pods
## 31001 port exposed
kubectl -n ${namespace} create -f deploy-service.yml 
kubectl -n ${namespace} get pods

## Testing URL with nodeport
docker ps
docker exec -it mariadb bash
> mysql -uroot -proot123
> CREATE USER 'helo'@localhost IDENTIFIED BY 'helo';
> SELECT User FROM mysql.user;
> GRANT ALL PRIVILEGES ON *.* TO helo'@localhost IDENTIFIED BY 'helo';
OR
> GRANT ALL PRIVILEGES ON 'yourDB'.* TO 'helo'@localhost;
> FLUSH PRIVILEGES;
