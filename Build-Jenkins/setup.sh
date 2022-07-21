
kubectl create namespace management-ns
kubectl run jenkins --image=jenkins -n management-ns --restart=Never -o yaml > deploy.yaml

kubectl apply -f deployment.yaml

kubectl expose deployment jenkins ---port=8080 --target-port=8080 --type=NodePort
