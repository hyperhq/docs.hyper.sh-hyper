# What is Hyper\_?

[Hyper\_](https://hyper.sh) is a secure container cloud service. Different from traditional Container-as-a-Service (CaaS) that run on top of existing Infrastructure-as-a-Service platform (i.e. AWS), Hyper\_ is a native container hosting service, in which **multi-tenants' containers are inherently safe to run side by side on bare metal**, instead of being nested in VMs.

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1229x399/bebf8e0ea7d0b82a8982b4c659b01804/caas.png)

# How does Hyper_ secure containers?

Hyper\_ uses a technology called [HyperContainer](github.com/hyperhq/hyper) to apply hardware-enforced isolation to containers, while keeping the sub-second startup performance. Instead of running Cgroup  and Namespace, HyperContainer launches the Docker images with plain hypervisor:

- Resource Limit and Access Isolation: `Cgroup + Namespace` ---> `Hypervisor (KVM/QEMU, Xen, etc)`
- `Host Kernel` ---> `Guest Kernel`

Therefore:
	
	HyperContainer = Hypervisor + Guest Kernel + Data (image)

In a HyperContainer, the application process is still able to access what it needs: kernel and data. The difference is that the container does not run on the host kernel. Instead, every container gets its own, independent, guest kernel. By doing this, the application running inside is perfectly isolated from both other containers and the host.

![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png)

The combination of the best from both worlds gives you the security of virtual machines to containers with the speed of containers. A HyperContainer is able to finish booting in milliseconds (~100ms), which is dramatically faster than VM. Some may argue that this speed still lags behind Linux container, but consider that application usually takes longer to launch, there is simply no difference in practice.
