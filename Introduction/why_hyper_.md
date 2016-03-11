# Why Hyper_?

- **Secure Container** - Built on [HyperContainer](https://github.com/hyperhq/hyper), Hyper_ leverages Intel VT technology to apply hardware-enforced isolation to containers, but manages to keep the signature tune of container: **50-100ms to start**. The combination of the best from both words is "**Secure as VM, Fast as Container**".


![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png)

- **Docker Native Workflow** - Try imagining Hyper_ cloud as a single gigantic remote host. You can use the native Docker workflow to run any number of containers at any time, without worrying things like capacity, cluster, scheduling, etc. The Docker native workflow makes no need to learn a new set of commands. Working with Hyper_ is as simple as running Docker on your own laptop.

 `hyper pull nginx mysql` // fetch images from (private) registries to Hyper_ cloud;

 `hyper run mysql db` // launch a secure container, no need to be nested in VMs;
 
 `hyper run nginx --link db` // different containers as they appear to run on the same host;

 `hyper fip associate 58.29.129.81 nginx` // associate floating public IP

 `hyper exec db /bin/sh` // remote access

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1317x490/d94b089c895cd3feaab21c5277491343/laptop-left.png)


- **Per Second Billing** - Hyper_ uses a **Per Second** pricing model. You can to spin up 100 containers in 3 seconds, crunch some data or run parallel builds on the latest commit for 20s, destroy all containers in 1s, and only pay for 3+20+1=23s. 

![](https://trello-attachments.s3.amazonaws.com/56b19c6e5bb4a89f92d0e71f/903x472/2ccb5880a4286dd6d4c14eb19b3dab99/upload_2_3_2016_at_2_21_34_PM.png)

- **5 seconds deployment** - From issuing `hyper run` till the point that the container is running, it takes only 5 seconds in Hyper_. Application is able to instantly response to the workload changes. 

- **SSD** – Hyper_ uses high-speed SSD to run all containers. 

- **10GB Network** - Hyper_ uses the lastest high-performance 10GB Ethernet for both in/outbound and internal traffic.

- **Cloud Portability** – By adhering open standards, we ensure seamless application migration between Hyper_ and other container environments. This also help Hyper_ to be the best candidate for your hybrid cloud.

### Secure as VM, Fast as Container





### Pay Per Second

### Hyper Elastic
Combined the **Pay Per Second** model with the "**Sub-second container startup time**" , Hyper_ allows application to instantly scale out/in. No longer need to wait minutes for VM to boot, nor waste money on over-provisioning extra capacity. 

Also, this super elasticity empowers **truly event-driven applications**, e.g. Event-driven (AWS Lamda), Big Data, CD/CI, etc.

### Persistent Storage
Hyper_ is shipped with replicated, distributed and fault-tolerant storage (like AWS EBS). You can run stateul workload with Hyper_'s volume!

