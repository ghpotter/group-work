
kubectl create namespace management-ns

kubectl apply -f deploy.yaml

kubectl expose deployment.apps/jenkins-app --type=NodePort --name=jenkins-access
