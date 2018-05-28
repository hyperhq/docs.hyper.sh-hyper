# What is Hyper?

As a serverless container hosting service, [Hyper](https://www.hyper.sh/hyper) allows you to run containers without having to manage VMs or clusters. With Hyper, you no longer have to provision, configure, and scale clusters of virtual machines to run containers. This removes the need to choose server types, decide when to scale your clusters, or optimize resource utilization. Hyper lets you focus on designing and building your applications instead of managing the underlying infrastructure.

Hyper is built to be consistent with Docker (API, workflow, etc.). The result is that if you know Docker, you will know how to use Hyper.  Imagine the entire cloud as a gigantic laptop in the cloud. Hyper allows you to deploy containers in production w running Docker on your own laptop.

 `hyper pull wordpress mysql` // fetch images from (private) registries to Hyper cloud;

 `hyper run mysql` // launch a secure container, no need to be nested in VMs;

 `hyper run --link mysql wordpress` // different containers as they appear to run on the same host;

 `hyper fip attach 58.29.129.81 wordpress` // attach floating public IP

 `hyper exec db /bin/sh` // remote access

![](https://trello-attachments.s3.amazonaws.com/56daae9b816ec930c8d98197/1051x413/256afdcdaf886adcaf93ce86edd5529b/docker_native_workflow.png)

- **3 Seconds to Deploy** - It takes only 3 seconds from issuing `hyper run` to the point where the container is running in Hyper. Your application is empowered with super elasticity to handle customer needs.

- **Per Second Billing** - Hyper uses a **Per Second** pricing model. You can to spin up 100 containers in 3 seconds, crunch some data or run parallel builds on the latest commit for 20s, destroy all containers in 1s, and only pay for 3+20+1=23s.

![](https://trello-attachments.s3.amazonaws.com/56b19c6e5bb4a89f92d0e71f/903x472/2ccb5880a4286dd6d4c14eb19b3dab99/upload_2_3_2016_at_2_21_34_PM.png)

- **Persistent Storage (SSD)** – Run stateful workloads with Hyper's persistent SSD storage. Multiple replicas will be automatically created with each volume to protect your data from failures. And feel free to take point-in-time snapshots for backup/restore.

- **Private Network (10Gbps, FREE)** - Hyper creates a default virtual private network for each user. Your container traffic is safely isolated from the rest. The network is built on 10Gbps Ethernet, and the best part is that all traffic is FREE!

- **No Lock-in** – Two requirements to move your application between Hyper and LXC-based cluster: use Docker image and use Docker APIs. Nothing else!

## Difference between Hyper and Hypernetes
<table class="table table-bordered table-striped table-condensed">
<tr>
<td></td><td>Platform</td><td>Interface</td><td>Avaiable Regions</td>
</tr>
<tr>
<td>Hyper</td><td>Docker</td><td>REST API, CLI</td><td>us-east-1, eu-central-1</td>
</tr>
<tr>
<td>Hypernetes</td><td>Kubernetes</td><td>REST API</td><td>gcp-us-central1</td>
</tr>
</table>
