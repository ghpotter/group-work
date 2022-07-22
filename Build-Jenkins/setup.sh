

# create the namespace for the container
kubectl create namespace management-ns

# create the yaml required to make a POD with jenkins running in it
kubectl run jenkins-app --image=jenkins:lts --port=8080 --dry-run=client -n management-ns -o yaml > deploy.yaml

kubectl apply -f deploy.yaml -n management-ns

# view deployments
kubectl get deployments -n management-ns

# unable to expose it because it says it cant find it
kubectl expose po jenkins-app --port=8080 --target-port=8080 --type=NodePort --name=jenkins-access

kubectl get pods -n management-ns

# for testing - quickly delete created pods
kubectl delete --all services
kubectl delete --all deployments
kubectl delete --all pods
rm deploy.yaml




# Get the IP of the service   try to
kubectl describe service/jenkins-svc | grep IP: | awk '{print $2;}'





 
