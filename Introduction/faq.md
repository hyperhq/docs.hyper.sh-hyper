# FAQ

### General
Q: What is Hyper ?
> Hyper is a serverless container hosting service. Hyper provides a Docker-consistent interface, so that if you know Docker, you will know how to use Hyper.

Q: How is Hyper different than AWS Fargate and Azure Container Instance?
`TODO`

### Feature

Q: How fast will containers be running in Hyper?
> It takes **about 5 seconds** from the issue of `hyper run` to the point where the container is running.

Q: How to schedule containers in Hyper ?
> No, you don't need to. Hyper is a serverless container hosting service, which means that you may launch any number of containers at any point of time, without worrying about the underlying infrastructure. Things like capacity planning, VM instance size, scheduling and resource utilization, are all gone!

Q: How to connect multiple containers in Hyper?
> By default, Hyper creates a L2 overlay network for each account, and place all containers of a user in one's default network, where all containers appear to run on the same node. This helps multi-tenant isolation as well as multi-container communication, e.g. you can simply connect containers in the same ways as you link containers on your local laptop:

	$ hyper run -d --name web --link mysql:db -p 80 nginx

Q: How to access my containers in Hyper?
> You can access a container using `hyper` CLI:

	$ hyper exec mycontainer /bin/sh
	or
	$ hyper attach mycontainer

Q: What does `hyper pull` do?
> `hyper pull` fetches images from a public or private registry to your Hyper account.

Q: How many containers can I run in Hyper?
> You are limited to running up to 100 containers per region, though you may [request to increase the quota](../FAQ/quota_and_limits.md).

Q: How quickly can I scale my containers both up and down?
> Hyper provides a super elastic container environment. You can spin-up or shutdown containers in less than 5 seconds.

Q: What happens to my data when a container terminates?
> The data stored on the container's `rootfs` will persist only as long as that container exists. However, data that is stored on additional volumes will persist independently of containers.

Q: Do you support sharing a single volume among multiple containers?
> While you are able to attach multiple volumes to a single container, attaching multiple containers to one volume is not supported at this time.

Q: Do volumes need to be un-mounted in order to take a snapshot? Does the snapshot need to complete before the volume can be used again?
> No, snapshots can be done in real time while the volume is attached and in use. However, snapshots only capture data that has been written to your volume, which might exclude any data that has been locally cached by your application or container. In order to ensure consistent snapshots on volumes attached to a container, we recommend cleanly detaching the volume, issuing the snapshot command, and then reattaching the volume.

Q: Why am I limited to 2 Floating IPs per region?
> Public (IPv4) IP addresses are scarce resources. We are working on IPv6 support.

Q: Does every container need one Floating IP?
> No, not every container needs a Floating IP. By default, every container comes with a private IP address and an internal domain name (specific to the network it resides in). The private address is attached exclusively with the container and is only returned to Hyper when the container is terminated. It should be adequate for most non-public-facing containers. Only the public-facing containers, such as web app, demand a Floating IP.

Q: Does Hyper use ECC memory?
> Yes, all the hardware underlying Hyper uses ECC memory.

Q: How do I migrate data from hyper.sh?
> There are two ways to migrate data to external storage. One is to use the hyper container as a file server, and the other is to use the hyper container as a client. Please refer to [our detail solution](../GettingStarted/migrate_data).


### Pricing

Q: What is the pricing plan of Hyper ?
> You pay only for what you use and there is no minimum fee. Pricing is per second consumed for each container size. Floating IPs are charged with a monthly rate: $1/IP/month. For more pricing information, please visit the [our pricing page](https://hyper.sh/pricing.html).

Q: When does billing begin and end?
> - Container: billing begins when Hyper launches a new container or starts a stopped container, ends when the container stops or terminates, either through an API call, or through container exits (success or failure).
> - Volume/Snapshot/Image:  billing begins when the storage object is created (`hyper volume create`, `hyper snapshot create`, `hyper pull`), ends upon removal.
> - Floating IP: billing begins when a new IP is allocated, ends when it is released. Partial month is treated as an entire month.

Q: Do your prices include taxes?
> Except as otherwise noted, our prices are exclusive of applicable taxes and duties, including VAT and applicable sales tax.
