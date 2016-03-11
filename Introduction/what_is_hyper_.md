# What is Hyper_?

In one line, [Hyper_](https://hyper.sh) is a secure container cloud service.

### Secure as VM, Fast as Container

Built on [HyperContainer](https://github.com/hyperhq/hyper), Hyper_ leverages Intel VT technology to apply hardware-enforced isolation to containers, but manages to keep the signature tune of container: **50-100ms to start**. 

The result of combining the best of both words is "**Secure as VM, Fast as Container**".

![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png)

### Docker Native Workflow
The side-effect of this VM-level security is a simple development workflow. Given the strong isolation, HyperContainer replaces VM to become the infrastructure building block. As such, the need of VM cluster is gone, along with things like capacity planning, reserved VM pool, instance bootstrapping, scheduling, COE management, etc. The entire Hyper_ cloud works like one single host, and containers are managed in the same way as on local laptop:

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1317x490/d94b089c895cd3feaab21c5277491343/laptop-left.png)

- `hyper pull` the image from (private) registries to the cloud;
- `hyper run` to launch container directly without VM;
- `hyper link` different containers as they appear to run on the same host;
- `hyper commit` to create new images;
- `hyper push` the image from the cloud to (private) registries;
- `hyper fip associate` floating public IPs to enable Internet access;
- `hyper exec` to access containers

What remains different is that this "cloud laptop" has infinite capacity. You can launch any number of containers at any time, without worrying how much memory left.

### Pay Per Second
Hyper_ uses a **Per Second** pricing model. You can to spin up 100 containers in 3 seconds, crunch some data or run parallel builds on the latest commit for 20s, destroy all containers in 1s, and only pay for 3+20+1=23s. 

![](https://trello-attachments.s3.amazonaws.com/56b19c6e5bb4a89f92d0e71f/903x472/2ccb5880a4286dd6d4c14eb19b3dab99/upload_2_3_2016_at_2_21_34_PM.png)

### Hyper Elastic
Combined the **Pay Per Second** model with the "**Sub-second container startup time**" , Hyper_ allows application to instantly scale out/in. No longer need to wait minutes for VM to boot, nor waste money on over-provisioning extra capacity. 

Also, this super elasticity empowers **truly event-driven applications**, e.g. Event-driven (AWS Lamda), Big Data, CD/CI, etc.

### Persistent Storage
Hyper_ is shipped with replicated, distributed and fault-tolerant storage (like AWS EBS). You can run stateul workload with Hyper_'s volume!

