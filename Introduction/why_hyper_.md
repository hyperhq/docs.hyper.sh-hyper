# Why Hyper_?

- **Secure Container** - Hyper_ applies the [hardware-enforced isolation](github.com/hyperhq/hyper) to containers. This means that your applications run with the same security of virtual machines, and the speed of containers.

![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png

- **Docker Native Workflow** - From your viewpoint, Hyper_ works like a single container host, with unlimited capacity. No more things like VM cluster, Scheduling, IaaS Management, Multi-Host Networking, etc. The Docker native workflow makes working with Hyper_ as simple as running Docker on a laptop:

 `hyper pull wordpress mysql` // fetch images from (private) registries to Hyper_ cloud;

 `hyper run mysql` // launch a secure container, no need to be nested in VMs;
 
 `hyper run --link mysql wordpress` // different containers as they appear to run on the same host;

 `hyper fip associate 58.29.129.81 wordpress` // associate floating public IP

 `hyper exec db /bin/sh` // remote access

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1317x490/d94b089c895cd3feaab21c5277491343/laptop-left.png)

- **Pay Per Second** - Combining the **Per Second** pricing model and the fast startup of container, Hyper_ allows you to spin up 100 containers in 3 seconds, crunch some data or run parallel builds on the latest commit for 20s, destroy all containers in 1s, and only pay for 3+20+1=23s. 

![](https://trello-attachments.s3.amazonaws.com/56b19c6e5bb4a89f92d0e71f/903x472/2ccb5880a4286dd6d4c14eb19b3dab99/upload_2_3_2016_at_2_21_34_PM.png)


- **Persistent Volume (SSD)** – Think of [AWS EBS](https://aws.amazon.com/ebs/), Hyper_ ships the similar replicated, distributed and fault-tolerant volumes to run your stateful containers, and the volume is powered by full SSD.

- **Private Network (Layer-2, 10Gbps）** - All of your containers run in your own Layer-2 private network. And the best part of this secure network is that is built on the lastest 10Gbps Ethernet.

- **No Lock-in** – As long as you use Docker image and Docker workflow, you are free to move application between Hyper_ and your laptop.
