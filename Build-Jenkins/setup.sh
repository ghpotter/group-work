

# create the namespace for the container
kubectl create namespace management-ns

# print out the
kubectl run jenkins-app --image=jenkins --port=8080 --dry-run=client -n management-ns -o yaml > deploy.yaml

kubectl apply -f deploy.yaml -n management-ns

# view deployments
kubectl get deployments -n management-ns

kubectl expose deployment.apps/jenkins-app --type=NodePort --name=jenkins-access

# unable to expose it because it says it cant find it
kubectl expose pods jenkins-app --port=8080 --target-port=8080 --type=NodePort --name=jenkins-access

kubectl get pods -n management-ns

# export CLUSTER_IP=$(kubectl get services/nfs-server -o go-template='{{(index.spec.clusterIP)}}');echo CLUSTER_IP=$CLUSTER_IP

# for testing - quickly delete created pods
kubectl delete --all services
kubectl delete --all deployments
kubectl delete --all pods
rm deploy.yaml
