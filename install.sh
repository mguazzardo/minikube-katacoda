 apt install -y containerd
 apt install -y docker.io
 systemctl unmask docker
 systemctl unmask docker.socket
 systemctl docker start
 curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_1.4.0.deb
 dpkg -i minikube_1.4.0.deb
 minikube config set vm-driver none
 minikube start
 chown -R $USER $HOME/.kube $HOME/.minikube
 curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
 dpkg -i minikube_1.4.0.deb
 chmod +x kubectl
 mv kubectl /usr/local/sbin/
 minikube addons enable dashboard
 sleep 5
 minikube service list
 kubectl patch -n kubernetes-dashboard service kubernetes-dashboard -p '{"spec": {"type":"NodePort"}}'
 kubectl get svc -n kubernetes-dashboard
 
