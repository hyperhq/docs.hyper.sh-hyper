# FAQ

Q: Do I need to create a VM to deploy my container?

> **No, think HyperServe as a laptop in the cloud**. The way you use HyperServe is the same as you play containers on your macbook. 

> Traditionally, public cloud users have to nest their Linux containers in VMs as the isolation boundary. Since HyperServe is built on the virtualized container, each individual container in HyperServe is inherently isolated from each other. Therefore, no more VM.

Q: What do you mean ***"A Laptop in the Cloud"***? From what I read, it sounds that I need to create a cluster, deploy a COE to schedule my containers, No?

> No, in HyperServe, developer don't need to prepare a cluster and manage the COE. You can use Hyper CLI on your mac to launch a container like:

        [root@user ~:]# hyper pull nginx:latest
        [root@user ~:]# hyper run nginx:latest

