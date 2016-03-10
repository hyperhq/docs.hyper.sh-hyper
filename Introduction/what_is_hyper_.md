# What is Hyper_?

[Hyper_](https://hyper.sh) is a secure container cloud service built on [virtualized container technology](https://github.com/hyperhq/hyperd). It leverages Intel VT technology to apply hardare-enforced isolation to containers. In short, container is **as secure as VM** in Hyper_.

### Docker Native Workflow
The side-effect of this VM-level security is a simple development workflow. Given the strong isolation, container replaces VM to become the new building block of the public cloud. As such, the need of VM cluster is gone, along with things like capacity planning, reserved VM, instance bootstrapping, scheduling, COE management, etc. The entire cloud works like one single host, and containers are managed in the same way as on local laptop:

- `hyper pull` the image from (private) registries to the cloud;
- `hyper run` to launch container directly without VM;
- `hyper link` different containers as they appear to run on the same host;
- `hyper commit` to create new images;
- `hyper push` the image from the cloud to (private) registries;
- `hyper fip associate` floating public IPs to enable Internet access;
- `hyper exec` to access containers

What remains different is that this "cloud laptop" has infinite capacity. Developers can launch any number of containers at any time, without worrying about how much memory left.

### Pay Per Second
Hyper_ provides **Per Second** pricing model. Per second billing means that you only pay for what you use. Combine that with sub-second start up times and you’ll only pay for exactly what you need.

### Hyper Elastic
Combined the **Pay Per Second** model with the "**Sub-second container startup time**" , Hyper_ allows application to instantly scale up and dow. You no longer need to wait minutes for VM to boot, nor waste money on over-provisioning extra capacity. More, Hyper_ empowers developers to build **truly event-driven applications**, e.g. Event-driven (AWS Lamda), Big Data, CD/CI, etc.


 
Hyper_ ships the industrial grade solutions:
- Distributed relicated storage for stateful workload
- L2 private network for multi-tenancy
