
kubectl create namespace management-ns

kubectl apply -f deploy.yaml

kubectl expose jenkins ---port=8080 --target-port=8080 --type=NodePort
