# dashboard installation
#ubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

#cat <<EOF | kubectl apply -f -
#apiVersion: v1
#kind: ServiceAccount
#metadata:
#  name: admin-user
#  namespace: kubernetes-dashboard
#EOF

#kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

# load balancer intsallation
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f ./srcs/loader.yaml
kubectl apply -f ./srcs/kustomization.yaml
docker build --tag nginx-img ./srcs/nginx && kubectl apply -f ./srcs/nginx.yaml
docker build --tag mysql-img ./srcs/mysql && kubectl apply -f ./srcs/mysql.yaml && kubectl apply -f ./srcs/mysql-pv.yaml
#docker build --tag phpmyadmin-test ./srcs/phpmyadmin && kubectl apply -f ./srcs/phpmyadmin.yaml
#docker build -t wordpress-img ./srcs/wordpress . && kubectl apply -f ./srcs/wordpress.yaml





#kubectl run  --image=mysql-test --restart=Never mysql-client -- mysql -h mysql -ppassword

# run dahboard
#kubectl proxy

#http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/    

#kubectl exec --stdin --tty mysql -- sh