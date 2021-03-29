# dashboard installation
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

# load balancer intsallation
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f ./srcs/loader.yaml
kubectl apply -f ./srcs/mysql-pv.yaml

docker build --tag nginx ./srcs/nginx
docker build --tag mysql ./srcs/mysql
#docker build --tag phpmyadmin-test ./srcs/phpmyadmin
#docker build --tag wordpress-test
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/mysql.yaml
#kubectl apply -f ./srcs/phpmyadmin.yaml


#kubectl run  --image=mysql-test --restart=Never mysql-client -- mysql -h mysql -ppassword

# run dahboard
kubectl proxy