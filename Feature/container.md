# Container

Under the hood, Hyper_ is using the virtualized container technology (open-source), called [HyperContainer](github.com/hyperhq/hyper), to run your Docker images. Simply put,

  > HyperContainer = Hypervisor + Docker image

It uses hypervisors (like KVM, Xen) as the alternatives for Cgroup and Namespace, forresource limitation and access control. The following diagram illustrates the difference between HyperContainer and Linux Container:

![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png)
  

Given the inherent isolation in HyperContainer, Hyper_ removes the need to nest Linux containers in VMs. Thus, you can launch containers at any time, without pre-provisioning the hosting VM.

