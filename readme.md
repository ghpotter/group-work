Group Work


Week 3 Friday Lab - As Group work for week 4

Team: Gregory Potter, Tristan Stringfellow


Question:
DevOps Lifecycle with AWS:

In this project, you’ll be creating the infra using terraform and will perform application/tool stack configuration and will effectively use Jenkins for running automated CICD for both the application and infra deployment. Provisioning a managed EKS cluster and setting up a mutable environment setup which ensures the HA and Resilience of the application.

Project Status:

good - terraform creation works

good - Jenkins is running

good - application created and works in container

pending - pipeline issues because of kubectl version issues

pending - issues with creating nodes



----Summary:

Gregory Potter:

I worked on creating the terraform files for the cluster. I got it working so that it creates two ec2 instances as auto-scaling nodes, IAM roles for the instances, VPCs (both private and public) and security groups. We started using modules but ran into a bug with one of the modules and decide to scrap them altogether and write the tf file without them. To do this, I started by looking at example set-ups then moved to reading the documentation at https://registry.terraform.io to figure out exactly what I needed for each part of the set-up.

After getting the terraform files to build a cluster, I moved on to setting up the software on the cluster. I used the steps on the here (https://www.golinuxcloud.com/setup-kubernetes-cluster-on-aws-ec2/#8_Create_AMI_-_Install_Kubernetes_Software) to give me a good outline to follow. Once I had kubernetes installed on both of the ec2 instances, I set one up as the controller(master) and the other as the agent(slave). The kubernetes deployment ended up not being stable as it would crash every couple of minutes and I could never find an exact error for why it was doing so. I tried destroying and recreating the clsuter deployment and setting the machines up again, but still ran into the same issue.  I've included the messages from running 'kubectl describe pod' and 'kubectl describe node' in the error.txt in this repository.

Tristan Stringfellow:

I worked on the application for deployment as well as setting up the pipeline for Jenkins.
I first created the Jenkins locally but later migrated it to run on the EC2 for Amazon Linux.
The Jenkins was created running on an EC2 with port 8080 added to the inbound rules.
Docker was added as well as kubectl for the automation in the pipeline.

The docker image is created containing a small python application that sends a webpage to any browser connecting from port 80
Its intended to be exposed as a webservice to the internet as a demo.
Because we worked on different components I did not have a cluster to use at first so I manually created an
EKS for testing some of the components required for the pipeline.  

While working on setting up the pipeline on the EC2 there were issues with the set up of kubectl due to version issues.
This should be resolved by installing a compatible version that works with the cluster but it may still be an issue.
This issue is not present on the cloud shell but is present on the EC2 System.
After that was resolved another issue was present when attempting to run kubectl with these steps
$ # Install kubectl to the system
$ aws configure                             <= Configure Aws so kubectl works
$ aws eks --region us-east-2 update-kubeconfig --name Test-Cluster   <= Authenticates and confirmed
$ kubectl get nodes
 error: You must be logged in to the server (Unauthorized)

The steps within the Jenkins pipeline is to pull the docker image to the local Ec2 system
where it will be pushed to the kubernetes cluster through the kubectl command.
A nodeport service will also be created through kubectl to expose the running container to the internet.
