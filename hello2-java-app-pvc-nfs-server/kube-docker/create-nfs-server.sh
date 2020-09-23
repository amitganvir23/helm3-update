export_dir=/export2/kubernetes/devtest
minikube.exe ssh "sudo mkdir -m 777 -p $export_dir"

minikube.exe ssh
sudo su -
echo '/export/kubernetes/devtest *(rw,sync,fsid=0)' > /etc/exports
exportfs -arv
showmount -e 192.168.99.100

minikube.exe ssh "showmount -e 192.168.99.100"
