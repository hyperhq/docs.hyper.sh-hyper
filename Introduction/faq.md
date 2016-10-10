# FAQ

### General
Q: What is Hyper.sh ?
> Hyper.sh is a secure container cloud service. It is designed for developers to run container in production **Simple and Secure**.

Q: How is Hyper.sh different than typical container services?
> **Simple and Secure**!

> Due to the lack of necessary isolation, Linux container is considered not secure in a multi-tenant public cloud. As such, most Container-as-a-Service ask users to bring their own VM cluster to deploy containers. However, this approach raises a number of issues:
> - **Capacity planning & CapEx**:  developers have to reserve the VM cluster before deploying anything, meaning that they have to decide the cluster size, VM size, etc.

> - **Wasted resources**: no matter how efficient the service schedules your workload, there will always be some resource in the pool sitting idle. Some may want to alleviate the problem by auto-adjusting the cluster, but VM scaling is slow and painful.

> - **Over-subscribed VM size**: DB containers prefer VMs with big memory, but web containers love high CPU. If you provision VM based on container size, you are actually doing the scheduler's job. Otherwise, you will have to use "Big & Tall" VMs across the entire fleet.

>  Hyper.sh leverages [virtualization](github.com/hyperhq/hyper) technology to apply hardware-enforced isolation to containers, and keep the sub-second startup performance. The combination of the best from both words gives you the security of virtual machines to containers with the speed of containers. Thus, the need of VM cluster is gone, along with things like capacity planning, CapEx, VM bootstrapping, scheduling, COE admin, etc. The entire Hyper.sh cloud works like "**A single remote host with unlimited capacity**". Developers can use the Docker native workflow to deploy applications in Hyper.sh, just the same as on your laptop.


> Hyper.sh uses a "**Per Second**" model, which differs fundamentally in the flexibility, control and significant cost savings it offers developers. You can spin up 100 containers in 2 seconds, crunch some data or run parallel builds on the lastest commit for 10s, destroy all containers in 1s, and Hyper.sh will only charge for 2+10+1=13s.

> Combined with the "**5-seconds**" launch time, Hyper.sh can respond to the workload requests instantly, which empowers developers to build **truly on-demand applications**, e.g. Event-driven (AWS Lambda), Big Data, CD/CI, etc.

### Product

Q: How quickly will containers be running in Hyper.sh?
> Usually it takes **about 5 seconds** from the issue of `hyper run` to the point where the container is running.

Q: How to schedule containers in Hyper.sh ?
> No, you don't need to. Hyper.sh works like "**a single host with unlimited capacity**". You may launch any number of containers at any point of time, without worrying about things like capacity planning, VM instance size, job scheduling and cluster utilization.

Q: How to connect multiple containers in Hyper.sh?
> By default, Hyper.sh creates a L2 overlay network for each account, and place all containers of a user in one's default network, where all containers appear to run on the same node. This helps multi-tenant isolation as well as multi-container communication, e.g. you can simply connect containers in the same ways as you link containers on your local laptop:

	$ hyper run -d --name web --link mysql:db -p 80 nginx

Q: How to access my containers in Hyper.sh?
> You can access a container using `hyper` CLI:

	$ hyper exec mycontainer /bin/sh
	or
	$ hyper attach mycontainer

Q: What does `hyper pull` do?
> `hyper pull` fetches images from a public or private registry to your Hyper.sh account.

Q: How many containers can I run in Hyper.sh?
> You are limited to running up to 100 containers per region, though you may [request to increase the quota](../Reference/quota_and_limits.md).

Q: How quickly can I scale my containers both up and down?
> Hyper.sh provides a super elastic container environment. You can spin-up or shutdown containers in less than 5 seconds.

Q: What happens to my data when a container terminates?
> The data stored on the container's `rootfs` will persist only as long as that container exists. However, data that is stored on additional volumes will persist independently of containers.

Q: Do you support sharing a single volume among multiple containers?
> While you are able to attach multiple volumes to a single container, attaching multiple containers to one volume is not supported at this time.

Q: Do volumes need to be un-mounted in order to take a snapshot? Does the snapshot need to complete before the volume can be used again?
> No, snapshots can be done in real time while the volume is attached and in use. However, snapshots only capture data that has been written to your volume, which might exclude any data that has been locally cached by your application or container. In order to ensure consistent snapshots on volumes attached to a container, we recommend cleanly detaching the volume, issuing the snapshot command, and then reattaching the volume.

Q: Why am I limited to 2 Floating IPs per region?
> Public (IPv4) IP addresses are scarce resources. We are working on IPv6 support.

Q: Does every container need one Floating IP?
> No, not every container needs a Floating IP. By default, every container comes with a private IP address and an internal domain name (specific to the network it resides in). The private address is attached exclusively with the container and is only returned to Hyper.sh when the container is terminated. It should be adequate for most non-public-facing containers. Only the public-facing containers, such as web app, demand a Floating IP.

Q: Does Hyper.sh use ECC memory?
> Yes, all the hardware underlying Hyper.sh uses ECC memory.

### Pricing

Q: What is the pricing plan of Hyper.sh ?
> You pay only for what you use and there is no minimum fee. Pricing is per second consumed for each container size. Floating IPs are charged with a monthly rate: $1/IP/month. For more pricing information, please visit the [our pricing page](https://hyper.sh/pricing.html).

Q: When does billing begin and end?
> - Container: billing begins when Hyper.sh launches a new container or starts a stopped container, ends when the container stops or terminates, either through an API call, or through container exits (success or failure).
> - Volume/Snapshot/Image:  billing begins when the storage object is created (`hyper volume create`, `hyper snapshot create`, `hyper pull`), ends upon removal.
> - Floating IP: billing begins when a new IP is allocated, ends when it is released. Partial month is treated as an entire month.

Q: Do your prices include taxes?
> Except as otherwise noted, our prices are exclusive of applicable taxes and duties, including VAT and applicable sales tax.
