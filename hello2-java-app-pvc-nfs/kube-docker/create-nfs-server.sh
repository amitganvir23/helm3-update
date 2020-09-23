export_dir=/data
minikube.exe ssh "sudo mkdir -m 777 -p $export_dir"

minikube.exe ssh
sudo su -
echo '/data *(rw,sync,fsid=0)' > /etc/exports
exportfs -arv
showmount -e 192.168.99.100

minikube.exe ssh "showmount -e 192.168.99.100"
