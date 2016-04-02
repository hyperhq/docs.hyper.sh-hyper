# Why Hyper\_?

- **Secure Container** - Hyper\_ leverages [virtualization](github.com/hyperhq/hyper) technology to apply hardware-enforced isolation to containers, and keep the sub-second startup performance. The combination of the best from both worlds gives you the security of virtual machines to containers with the speed of containers.

![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png)

- **Docker Native Workflow** - Imagine the entire Hyper\_ cloud as a single remote host with unlimited capacity. You can use the same Docker native workflow to deploy containers. Working with Hyper\_ is as simple as running Docker on your own laptop.

 `hyper pull wordpress mysql` // fetch images from (private) registries to Hyper\_ cloud;

 `hyper run mysql` // launch a secure container, no need to be nested in VMs;
 
 `hyper run --link mysql wordpress` // different containers as they appear to run on the same host;

 `hyper fip associate 58.29.129.81 wordpress` // associate floating public IP

 `hyper exec db /bin/sh` // remote access

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1051x413/256afdcdaf886adcaf93ce86edd5529b/docker_native_workflow.png)

- **3 Seconds to Deploy** - It takes only 3 seconds from issuing `hyper run` to the point where the container is running in Hyper\_. Your application is empowered with super elasticity to handle customer needs.

- **Per Second Billing** - Hyper\_ uses a **Per Second** pricing model. You can to spin up 100 containers in 3 seconds, crunch some data or run parallel builds on the latest commit for 20s, destroy all containers in 1s, and only pay for 3+20+1=23s. 

![](https://trello-attachments.s3.amazonaws.com/56b19c6e5bb4a89f92d0e71f/903x472/2ccb5880a4286dd6d4c14eb19b3dab99/upload_2_3_2016_at_2_21_34_PM.png)

- **Persistent Storage (SSD)** – Run stateful workloads with Hyper\_'s persistent SSD storage. Multiple replicas will be automatically created with each volume to protect your data from failures. And feel free to take point-in-time snapshots for backup/restore.

- **Private Network (10Gbps, FREE)** - Hyper\_ creates a default virtual private network for each user. Your container traffic is safely isolated from the rest. The network is built on 10Gbps Ethernet, and the best part is that all traffic is FREE!

- **No Lock-in** – Two requirements to move your application between Hyper\_ and LXC-based cluster: use Docker image and use Docker APIs. Nothing else!

