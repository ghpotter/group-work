

# create the namespace for the container
kubectl create namespace management-ns

# create the yaml required to make a POD with jenkins running in it
kubectl run jenkins-app --image=jenkins:lts --port=8080 --dry-run=client -n management-ns -o yaml > deploy.yaml

kubectl apply -f deploy.yaml -n management-ns

# view deployments
kubectl get deployments -n management-ns

# create the service to allow for node port access
kubectl create service nodeport jenkins-svc --tcp=8080:8080 --dry-run=client -o yaml > jenkins-nodeport.yaml
kubectl apply -f jenkins-nodeport.yaml -n management-ns

# unable to expose it because it says it cant find it
kubectl expose svc jenkins-svc --port=8080 --target-port=8080 --type=NodePort --name=jenkins-access


kubectl get pods -n management-ns

# for testing - quickly delete created pods
kubectl delete --all services
kubectl delete --all deployments
kubectl delete --all pods
rm deploy.yaml




# view the node IP
kubectl describe service/jenkins-svc | grep IP: | awk '{print $2;}'
