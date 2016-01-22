# FAQ

Q: Why I DON'T need VM to run my container in Hyper_ ?

> Traditionally, Linux container is not considered secure in a multi-tenant environment, due to the lack of necessary kernel isolation. In such cases, VMs are employed as the security boundary to separate different tenants' containers.

> Hyper_, on the other hand, leverages Intel VT, the same isolation technology in VM, to isolate containers. With the hardware-enforced capability, all containers in Hyper_ are inherently secured, and no longer need to be nested in VMs.

Q: How do I schedule my containers in Hyper_ ?
> No, you don't. 

> Since containers are isolated from each other in Hyper_, you no longer need VM. Then the cluster is gone, along with things like capacity planning, VM bootstrapping, scheduling, COE admin, etc. 

> Instead of "DIY" (scheduling), Hyper_ works just like EC2: **you can launch any number of containers at any time, without setting up anything**.

Q: What does `hyper pull` do?
> `hyper pull` fetches images from a public or private registry to the image mirror at Hyper_. This helps to avoid repeated downloading, if you launch the same image several times.

Q: What is Hyper_ ?
> Hyper_ is a secure container cloud service. It is designed to make container hosting easy and secure for developers.

Q: What can I do with Hyper_ ?
> Hyper_ provides a simple and secure service to run your containers.

reduces the time required to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your computing requirements change. Amazon EC2 changes the economics of computing by allowing you to pay only for capacity that you actually use.

Q: How quickly will containers be running?
> Typically it takes less than 5 seconds from the issue of `hyper run` to the point where the container is running.

Q: How do I access my containers?
> 

The RunInstances call that initiates execution of your application stack will return a set of DNS names, one for each system that is being booted. This name can be used to access the system exactly as you would if it were in your own data center. You own that machine while your operating system stack is executing on it.

Q: How many instances can I run in Amazon EC2?

You are limited to running up to 20 On-Demand Instances, purchasing 20 Reserved Instances, and requesting Spot Instances per your dynamic Spot limit per region. New AWS accounts may start with limits that are lower than the limits described here. Certain instance types are further limited per region as follows:

Q: How quickly can I scale my capacity both up and down?

Amazon EC2 provides a truly elastic computing environment. Amazon EC2 enables you to increase or decrease capacity within minutes, not hours or days. You can commission one, hundreds or even thousands of server instances simultaneously. When you need more instances, you simply call RunInstances, and Amazon EC2 will typically set up your new instances in a matter of minutes. Of course, because this is all controlled with web service APIs, your application can automatically scale itself up and down depending on its needs.

Q: Does Hyper_ use ECC memory?
> Yes, all the hardware underlying Hyper_ uses ECC memory.

Q: How is this service different than a plain container service?
> Traditional hosting services generally provide a pre-configured resource for a fixed amount of time and at a predetermined cost. Amazon EC2 differs fundamentally in the flexibility, control and significant cost savings it offers developers, allowing them to treat Amazon EC2 as their own personal data center with the benefit of Amazon.com’s robust infrastructure.

> When computing requirements unexpectedly change (up or down), Amazon EC2 can instantly respond, meaning that developers have the ability to control how many resources are in use at any given point in time. In contrast, traditional hosting services generally provide a fixed number of resources for a fixed amount of time, meaning that users have a limited ability to easily respond when their usage is rapidly changing, unpredictable, or is known to experience large peaks at various intervals.

> Secondly, many hosting services don’t provide full control over the compute resources being provided. Using Amazon EC2, developers can choose not only to initiate or shut down instances at any time, they can completely customize the configuration of their instances to suit their needs – and change it at any time. Most hosting services cater more towards groups of users with similar system requirements, and so offer limited ability to change these.

> Finally, with Amazon EC2, developers enjoy the benefit of paying only for their actual resource consumption – and at very low rates. Most hosting services require users to pay a fixed, up-front fee irrespective of their actual computing power used, and so users risk overbuying resources to compensate for the inability to quickly scale up resources within a short time frame.

Q: How will I be charged and billed for my use of Hyper_ ?
> You pay only for what you use and there is no minimum fee. Pricing is per instance-hour consumed for each instance type. Partial instance-hours consumed are billed as full hours. There is no Data Transfer charge between two Amazon Web Services within the same region (e.g., between Amazon EC2 US West and another AWS service in the US West). Data transferred between AWS services in different regions will be charged as Internet Data Transfer on both sides of the transfer. Usage for other Amazon Web Services is billed separately from Amazon EC2.

> For the pricing information, please visit the [our pricing page](https://hyper.sh/pricing/).

Q: When does billing of my Amazon EC2 systems begin and end?
> Billing commences when Amazon EC2 initiates the boot sequence of an AMI instance. Billing ends when the instance terminates, which could occur through a web services command, by running "shutdown -h", or through instance failure. When you stop an instance, we shut it down but don't charge hourly usage for a stopped instance, or data transfer fees, but we do charge for the storage for any Amazon EBS volumes. To learn more, visit the AWS Documentation.

Q: What defines billable EC2 instance-hours?
> Instance-hours are billed for any time your instances are in a "running" state. If you no longer wish to be charged for your instance, you must "stop" or "terminate" the instance to avoid being billed for additional instance-hours. Billing starts when an instance transitions into the running state.

Q: Do your prices include taxes?
> Except as otherwise noted, our prices are exclusive of applicable taxes and duties, including VAT and applicable sales tax. For customers with a Japanese billing address, use of the Asia Pacific (Tokyo) Region is subject to Japanese Consumption Tax. Learn more.

Q: Why am I limited to 5 Elastic IP addresses per region?
> Public (IPV4) internet addresses are a scarce resource. There is only a limited amount of public IP space available, and Amazon EC2 is committed to helping use that space efficiently.

> By default, all accounts are limited to 5 Elastic IP addresses per region. If you need more the 5 Elastic IP addresses, we ask that you apply for your limit to be raised. We will ask you to think through your use case and help us understand your need for additional addresses. You can apply for more Elastic IP address here. Any increases will be specific to the region they have been requested for.

Q: Do I need one Elastic IP address for every instance that I have running?
> No. You do not need an Elastic IP address for all your instances. By default, every instance comes with a private IP address and an internet routable public IP address. The private address is associated exclusively with the instance and is only returned to Amazon EC2 when the instance is stopped or terminated. The public address is associated exclusively with the instance until it is stopped, terminated or replaced with an Elastic IP address. These IP addresses should be adequate for many applications where you do not need a long lived internet routable end point. Compute clusters, web crawling, and backend services are all examples of applications that typically do not require Elastic IP addresses.

Q: How long does it take to remap an Elastic IP address?
> The remap process currently takes several minutes from when you instruct us to remap the Elastic IP until it fully propagates through our system.

Q: Can I configure the reverse DNS record for my Elastic IP address?
> Yes, you can configure the reverse DNS record of your Elastic IP address by filling out this form. Note that a corresponding forward DNS record pointing to that Elastic IP address must exist before we can create the reverse DNS record.

Q: What happens to my data when a container terminates?
> The data stored on the container's `rootfs` will persist only as long as that container exists. However, data that is stored on a volume will persist independently of the life of the container. 

Q: What kind of performance can I expect from Amazon EBS volumes?
> Amazon EBS provides three volume types: General Purpose (SSD) volumes, Provisioned IOPS (SSD) volumes, and Magnetic volumes. These volume types differ in performance characteristics and price, allowing you to tailor your storage performance and cost to the needs of your applications. For more performance infomation see the EBS product details page.

> For additional information on Amazon EBS performance, see the Amazon EC2 User Guide’s EBS section.

Q: Do you support sharing a single volume among multiple containers?
> While you are able to attach multiple volumes to a single containers, attaching multiple containers to one volume is not supported at this time.

Q: Do volumes need to be un-mounted in order to take a snapshot? Does the snapshot need to complete before the volume can be used again?
> No, snapshots can be done in real time while the volume is attached and in use. However, snapshots only capture data that has been written to your Amazon EBS volume, which might exclude any data that has been locally cached by your application or OS. In order to ensure consistent snapshots on volumes attached to an instance, we recommend cleanly detaching the volume, issuing the snapshot command, and then reattaching the volume. For Amazon EBS volumes that serve as root devices, we recommend shutting down the machine to take a clean snapshot.

Q: Are snapshots versioned? Can I read an older snapshot to do a point-in-time recovery?
> Each snapshot is given a unique identifier, and an optional user-friendly name.

