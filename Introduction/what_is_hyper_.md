# What is Hyper\_?

[Hyper\_](https://hyper.sh) is a secure container hosting service. What makes it different from AWS (Amazon Web Services) is that you don't start servers, but start docker images directly from Docker Hub or other registries. Hyper\_ is running the containers in a new way, in which **multi-tenants' containers are inherently safe to run side by side on bare metal**, instead of being nested in VMs. This benefits you in being safe and cheap at the same time and you can focus on your app instead of maintaing servers.

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1229x399/bebf8e0ea7d0b82a8982b4c659b01804/caas.png)

# How does Hyper_ run secure containers?

At Hyper\_  have we made a project called [HyperContainer](github.com/hyperhq/hyper) to secure hardware-enforced isolation between containers, while still keeping the sub-second startup performance.

The difference is that the container does not run on the host kernel. Instead, every container gets its own, independent, guest kernel. By doing this, the application running inside is perfectly isolated from both other containers and the host. In a HyperContainer, the application process is still able to access what it needs: kernel and data.


Instead of running Cgroup and Namespace, HyperContainer launches the Docker images with plain hypervisor:

- Resource Limit and Access Isolation: `Cgroup + Namespace` ---> `Hypervisor (KVM/QEMU, Xen, etc)`
- `Host Kernel` ---> `Guest Kernel`

Therefore:

	HyperContainer = Hypervisor + Guest Kernel + Data (image)


![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png)

The combination of the best from both worlds gives you the security of virtual machines to containers with the speed of containers. A HyperContainer is able to finish booting in milliseconds (~100ms), which is dramatically faster than VM. Some may argue that this speed still lags behind Linux container, but consider that application usually takes longer to launch, there is no practical difference.
