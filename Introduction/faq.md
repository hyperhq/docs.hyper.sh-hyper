# FAQ

### General
Q: What is Hyper_ ?
> Hyper_ is a secure container cloud service. It is designed for developers to run container in production **simple and secure**.

Q: How is Hyper_ different than typical container services?
> **Simple, Secure, Save**!

> Due to the lack of necessary isolation, Linux container is considered not secure in a multi-tenant public cloud. As such, many container services ask users to bring their own VM cluster to deploy containers. However, this raises a number of management issues:
> - Capacity planning & CapEx:  developers have to acquire the cluster beforehand, meaning that things will never be lean
> - Wasted resources: no matter how efficient the service schedules your containers, there will always be some resource sitting idle in the pool
> - Over-subscribed VM size: a DB container needs a VM with big mem, and a web container needs high CPU. To make sure different VMs have enough capacity for various containers, developers are forced to use "Big & Tall" VMs across the entire fleet.
> - Slow to scale up/down: a VM typically takes minutes to provision, which makes the cluster slow to scale to handle the traffic spike

> Hyper_, on the other hand, leverages Intel VT, the same isolation technology in VM, to isolate containers. **With the hardware-enforced isolation, containers in Hyper_ are inherently secured**. Without the need of VMs, cluster is gone, along with things like capacity planning, CapEx, VM bootstrapping, scheduling, COE admin, etc. Thus, Hyper_ works like "**A remote laptop with unlimited capacity**". Developers may launch any number of containers at any point of time, completely isolated from others, without preparing anything.

> From the pricing perspective, Hyper_ uses a "**Resource-Second**" model, which differs fundamentally in the flexibility, control and significant cost savings it offers developers. Instead of a pre-configured instance type for a fixed amount of time and at a predetermined cost, Hyper_ allows developers to decide different cpu, mem, storage size and charge by second. 

> Combined with the "**5-seconds**" launch time, Hyper_ can respond to the workload requests instantly, which empowers developers to build **truly on-demand applications**, e.g. Event-driven (AWS Lamda), Big Data, CD/CI, etc.
 
### Product

Q: How quickly will containers be running in Hyper_?
> Usually it takes **less than 5 seconds** from the issue of `hyper run` to the point where the container is running.

Q: How to schedule containers in Hyper_ ?
> No, you don't. Hyper_ works like "**A remote laptop with unlimited capacity**". You may launch any number of containers at any point of time, and all containers appear to run on a single host. Therefore, you don't need 

Q: How to connect multiple containers in Hyper_?
> By default, Hyper_ creates a L2 private network for each account, and place all containers of a user in her default network. With the help of L2 isolation and connectivity, you can simply connect containers in the same ways as you link containers on your local laptop:

	$ hyper run nginx --link dbcontainer

Q: How to access my containers in Hyper_?
> You can access a container using `hyper` CLI:

	$ hyper exec mycontainer /bin/sh
	or
	$ hyper attach mycontainer

Q: What does `hyper pull` do?
> `hyper pull` fetches images from a public or private registry to Hyper_'s internal mirror . This helps to avoid repeated downloading of the same image.

Q: How many containers can I run in Hyper_?
> You are limited to running up to 100 containers per region, though you may [request to increase the quota](../Reference/quota_and_limits.md).

Q: How quickly can I scale my containers both up and down?
> Hyper_ provides a truly elastic container environment. You can spin-up or shutdown one, hundreds or even thousands of containers simultaneously in less than 5 seconds.

Q: What happens to my data when a container terminates?
> The data stored on the container's `rootfs` will persist only as long as that container exists. However, data that is stored on additional volumes will persist independently of containers. 

`TODO`Q: What kind of performance can I expect from volumes?
> ~~TODO~~

Q: Do you support sharing a single volume among multiple containers?
> While you are able to attach multiple volumes to a single containers, attaching multiple containers to one volume is not supported at this time.

`TODO`Q: Do volumes need to be un-mounted in order to take a snapshot? Does the snapshot need to complete before the volume can be used again?
> No, snapshots can be done in real time while the volume is attached and in use. However, snapshots only capture data that has been written to your Amazon EBS volume, which might exclude any data that has been locally cached by your application or OS. In order to ensure consistent snapshots on volumes attached to an instance, we recommend cleanly detaching the volume, issuing the snapshot command, and then reattaching the volume. For Amazon EBS volumes that serve as root devices, we recommend shutting down the machine to take a clean snapshot.

Q: Are snapshots versioned? Can I read an older snapshot to do a point-in-time recovery?
> Each snapshot is given a unique identifier, and an optional user-friendly name.

Q: Why am I limited to 5 Flaoting IPs per region?
> Public (IPv4) IP addresses are a scarce resource. We are working on IPv6 support.

Q: Does every container need one Floating IP?
> No, not every container needs a Floating IP. By default, every container comes with a private IP address and an internal domain name (specific to the network it resides in). The private address is associated exclusively with the container and is only returned to Hyper_ when the container is terminated. It should be adequate for most non-public-facing containers. Only the public-facing containers, such as web app, demand a Floating IP.

Q: Does Hyper_ use ECC memory?
> Yes, all the hardware underlying Hyper_ uses ECC memory.

### Pricing

Q: What is the pricing plan of Hyper_ ?
> You pay only for what you use and there is no minimum fee. Pricing is per second consumed for each resource (CPU, Mem, Storage). Floating IPs are charged with a monthly rate: $1/ip/month. For the pricing information, please visit the [our pricing page](https://hyper.sh/pricing/).

Q: When does billing begin and end?
> - Container: billing begins when Hyper_ launches a new container or start a stopped container, ends when the container stops or terminates, either through an API call, or through container exists (success or failure).
> - Volume/Snapshot/Image:  billing begins when the storage object is created (`hyper volume create`, `hyper volume snapshot`, `hyper pull`), ends upon removal.
> - Floating IP: billing begins when a new IP is allocated, ends when it is released. Partial month is treated as a entire month.

Q: Do your prices include taxes?
> Except as otherwise noted, our prices are exclusive of applicable taxes and duties, including VAT and applicable sales tax.

### Privacy

### Policy

