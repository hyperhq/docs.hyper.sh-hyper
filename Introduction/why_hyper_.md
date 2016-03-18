# Why Hyper_?

- **Secure Container** - Built on [HyperContainer](https://github.com/hyperhq/hyper), Hyper_ leverages Intel VT technology to apply hardware-enforced isolation to containers, but manages to keep the signature tune of container: **sub-second to start**. The combination of the best from both words is "**Secure as VM, Fast as Container**".

![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png
- **Instant Deployment** - It takes only 3 seconds from deploy a secure containers in Hyper_. Application becomes super-elastic to handle customer needs

- **Docker Native Workflow** - Try imagining Hyper_ cloud as a single gigantic remote host. You can use the native Docker workflow to run any number of containers at any time, without worrying things like capacity, cluster, scheduling, etc. The Docker native workflow makes no need to learn a new set of commands. Working with Hyper_ is as simple as running Docker on your own laptop.

 `hyper pull wordpress mysql` // fetch images from (private) registries to Hyper_ cloud;

 `hyper run mysql` // launch a secure container, no need to be nested in VMs;
 
 `hyper run --link mysql wordpress` // different containers as they appear to run on the same host;

 `hyper fip associate 58.29.129.81 wordpress` // associate floating public IP

 `hyper exec db /bin/sh` // remote access

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1317x490/d94b089c895cd3feaab21c5277491343/laptop-left.png)

- **Per Second Billing** - Hyper_ uses a **Per Second** pricing model. You can to spin up 100 containers in 3 seconds, crunch some data or run parallel builds on the latest commit for 20s, destroy all containers in 1s, and only pay for 3+20+1=23s. 

![](https://trello-attachments.s3.amazonaws.com/56b19c6e5bb4a89f92d0e71f/903x472/2ccb5880a4286dd6d4c14eb19b3dab99/upload_2_3_2016_at_2_21_34_PM.png)


- **Persistent Volume with 100% SSD** – Run stateful workload using Hyper_’s replicated, distributed and fault-tolerant volume, powered by full SSD.

- **L2 Overlay Network on 10Gbps Ethernet** - Hyper_ setup a Layer-2 overlay network for each users to isolate the container traffic. And the best part is that it is built on the lastest 10Gbps Ethernet.

- **No Lock-in** – Two requirements to move your application between Hyper_ and LXC-based cluster: use Docker image and use Docker APIs. Nothing else!
