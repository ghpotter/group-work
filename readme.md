Group Work


Week 3 Friday Lab - As Group work for week 4

Team: Gregory Potter, Tristan Stringfellow


Question:
DevOps Lifecycle with AWS:

In this project, you’ll be creating the infra using terraform and will perform application/tool stack configuration and will effectively use Jenkins for running automated CICD for both the application and infra deployment. Provisioning a managed EKS cluster and setting up a mutable environment setup which ensures the HA and Resilience of the application.

Project Status:

good - terraform creation works

good - jenkins is running

good - application created and works in container

pending - pipeline issues because of kubectl version issues

pending - issues with creating nodes


----Summary:
Gregory Potter:
I worked on creating the terraform files for the cluster. I got it working so that it creates two ec2 instances as auto-scaling nodes, IAM roles for the instances, VPCs (both private and public) and security groups. We started using modules but ran into a bug with one of the modules and decide to scrap them altogether and write the tf file without them. To do this, I started by looking at example set-ups then moved to reading the documentation at https://registry.terraform.io to figure out exactly what I needed for each part of the set-up.

After getting the terraform files to build a cluster, I moved on to setting up the software on the cluster. I used the steps on the here (https://www.golinuxcloud.com/setup-kubernetes-cluster-on-aws-ec2/#8_Create_AMI_-_Install_Kubernetes_Software) to give me a good outline to follow. Once I had kubernetes installed on both of the ec2 instances, I set one up as the controller(master) and the other as the agent(slave). The kubernetes deployment ended up not being stable as it would crash every couple of minutes and I could never find an exact error for why it was doing so. I tried destroying and recreating the clsuter deployment and setting the machines up again, but still ran into the same issue.  I've included the messages from running 'kubectl describe pod' and 'kubectl describe node' in the error.txt in this repository.