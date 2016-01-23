# FAQ

### General
Q: What is Hyper_ ?
> Hyper_ is a container cloud service. It is designed to make container hosting **simple and secure** for developers.

Q: How is Hyper_ different than traditional container services?
> In a multi-tenant hosting environment, Linux container is not considered secure. As such, many container services requires user to bring their own VMs. This raises a number of issues:
> - Capacity planning:  the user have to decide the number and size of VMs, and the storage/network configuration
> - Idle resources: no matter how efficient the container service schedules your containers, there will always be some idle resources in the VM pool
> - Over-subscribed VM size: a DB container needs a VM with big mem, and a web container needs high CPU. To make sure different VMs have enough capacity for various containers, the user usually create "Big & Tall" VMs. Otherwise, why need the scheduler at all?
> - Slow to scale up/down: a VM typically takes minutes to provision, which makes it slow to handle the traffic spike

Multi-tenant container hosting services generally provide a pre-configured resource for a fixed amount of time and at a predetermined cost. Amazon EC2 differs fundamentally in the flexibility, control and significant cost savings it offers developers, allowing them to treat Amazon EC2 as their own personal data center with the benefit of Amazon.com’s robust infrastructure.

> When computing requirements unexpectedly change (up or down), Amazon EC2 can instantly respond, meaning that developers have the ability to control how many resources are in use at any given point in time. In contrast, traditional hosting services generally provide a fixed number of resources for a fixed amount of time, meaning that users have a limited ability to easily respond when their usage is rapidly changing, unpredictable, or is known to experience large peaks at various intervals.

> Secondly, many hosting services don’t provide full control over the compute resources being provided. Using Amazon EC2, developers can choose not only to initiate or shut down instances at any time, they can completely customize the configuration of their instances to suit their needs – and change it at any time. Most hosting services cater more towards groups of users with similar system requirements, and so offer limited ability to change these.

> Finally, with Amazon EC2, developers enjoy the benefit of paying only for their actual resource consumption – and at very low rates. Most hosting services require users to pay a fixed, up-front fee irrespective of their actual computing power used, and so users risk overbuying resources to compensate for the inability to quickly scale up resources within a short time frame.

> Think Hyper_ as **a gigantic host in the cloud, where you can run containers in the same way as on your laptop, but with unlimited capacity and secure**. Hyper_ changes the economics of cloud hosting by adopting a "**Billing by Second**" model, allowing greater elasticity in .
 
### Product

Q: How quickly will containers be running?
> Usually it takes **less than 5 seconds** from the issue of `hyper run` to the point where the container is running.

Q: Is the container secure in Hyper_?
> Traditionally, Linux container is not considered secure in a multi-tenant environment, due to the lack of necessary kernel isolation. In such cases, VMs are employed as the security boundary to separate different tenants' containers.

> Hyper_, on the other hand, leverages Intel VT, the same isolation technology in VM, to isolate containers. With the hardware-enforced isolation, all containers in Hyper_ are inherently secured, and no longer need to be nested in VMs.

> At the network side, Hyper_ creates a private layer-2 network for each account, and all containers of one account are placed in the network of that user to ensure the complete traffic isolation.

Q: How to schedule containers in Hyper_ ?
> No, you don't. 

> Since containers are isolated from each other in Hyper_, you no longer need VM to host containers. Then the cluster is gone, along with things like capacity planning, reserved instance, VM bootstrapping, scheduling, COE admin, etc. 

> Instead of "DIY" (scheduling), Hyper_ works just like EC2: **you can launch any number of containers at any time, pay for what you use, without preparing anything**.

Q: How to connect multiple containers?
> With the help of Hyper_'s L2 private network, you can simply connect containers in the same ways as you link containers on your laptop:

	$ hyper run nginx --link dbcontainer

Q: How to access my containers?
> You can access a container using `hyper` CLI:

	$ hyper exec mycontainer /bin/sh
	or
	$ hyper attach mycontainer

Q: What does `hyper pull` do?
> `hyper pull` fetches images from a public or private registry to the image mirror at Hyper_. This helps to avoid repeated downloading, if you launch the same image several times.

Q: How many containers can I run in Hyper_?
> You are limited to running up to 100 containers per region, though you may [request to increase the quota](../Reference/quota_and_limits.md).

Q: How quickly can I scale my containers both up and down?
> Hyper_ provides a truly elastic container environment. You can spin-up or shutdown one, hundreds or even thousands of containers simultaneously in less than 5 seconds.

Q: What happens to my data when a container terminates?
> The data stored on the container's `rootfs` will persist only as long as that container exists. However, data that is stored on a volume will persist independently of the life of the container. 

`TODO`Q: What kind of performance can I expect from volumes?
> Hyper_ provides three volume types: General Purpose (SSD) volumes, Provisioned IOPS (SSD) volumes, and Magnetic volumes. These volume types differ in performance characteristics and price, allowing you to tailor your storage performance and cost to the needs of your applications. For more performance infomation see the EBS product details page.

Q: Do you support sharing a single volume among multiple containers?
> While you are able to attach multiple volumes to a single containers, attaching multiple containers to one volume is not supported at this time.

`TODO`Q: Do volumes need to be un-mounted in order to take a snapshot? Does the snapshot need to complete before the volume can be used again?
> No, snapshots can be done in real time while the volume is attached and in use. However, snapshots only capture data that has been written to your Amazon EBS volume, which might exclude any data that has been locally cached by your application or OS. In order to ensure consistent snapshots on volumes attached to an instance, we recommend cleanly detaching the volume, issuing the snapshot command, and then reattaching the volume. For Amazon EBS volumes that serve as root devices, we recommend shutting down the machine to take a clean snapshot.

Q: Are snapshots versioned? Can I read an older snapshot to do a point-in-time recovery?
> Each snapshot is given a unique identifier, and an optional user-friendly name.

Q: Why am I limited to 5 Flaoting IPs per region?
> Public (IPv4) IP addresses are a scarce resource. And Hyper_ is working on IPv6 support.

Q: Does every container need one Floating IP?
> No, not every container needs a Floating IP. By default, every container comes with a private IP address and an internal domain name (specific to the network it resides in). The private address is associated exclusively with the container and is only returned to Hyper_ when the container is terminated. It should be adequate for most non-public-facing containers. Only the public-facing containers, such as web app, demand a Floating IP.

Q: Does Hyper_ use ECC memory?
> Yes, all the hardware underlying Hyper_ uses ECC memory.

### Pricing

Q: What is the pricing plan of Hyper_ ?
> You pay only for what you use and there is no minimum fee. Pricing is per container-second consumed for each resource (CPU, Mem, Storage). Floating IPs are charged with a monthly rate: $1/ip/month. For the pricing information, please visit the [our pricing page](https://hyper.sh/pricing/).

Q: When does billing begin and end?
> - Container: billing begins when Hyper_ launches a new container or start a stopped container, ends when the container stops or terminates, either through an API call, or through container exists (success or failure).
> - Volume/Snapshot/Image:  billing begins when the storage object is created (`hyper volume create`, `hyper volume snapshot`, `hyper pull`), ends upon removal.
> - Floating IP: billing begins when a new IP is allocated, ends when it is released. Partial month is treated as a entire month.

Q: Do your prices include taxes?
> Except as otherwise noted, our prices are exclusive of applicable taxes and duties, including VAT and applicable sales tax.

### Privacy

### Policy

