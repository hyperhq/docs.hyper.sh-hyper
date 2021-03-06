# Container

Simply put, [HyperContainer](https://github.com/hyperhq/hyperd) is a virtualized container technology that allows you to run Docker images on hypervisor (KVM, Xen, etc.):

> HyperContainer = Hypervisor + Docker Image

![](https://trello-attachments.s3.amazonaws.com/5694785e124f36d746f5c7be/1511x393/b8b5cd31b59af44c0c86349e150438fb/HyperContainer_vs_LinuxContainer.png)

By combining the best from both virtualization and container world, HyperContainer is able to bring the hardware-enforced isolation as VM, and the speed of container.

|  . | VM | Container | HyperContainer |
|:-:|:-:|:-:|:-:|
|ISOLATION|**Strong**|Weak|**Strong**|
|PORTABLE   |No   |**Yes**   |**Yes**   |
|BOOT|Slow (seconds)   |**Fast (sub-seconds)**   |**Fast (sub-seconds)**   |
|IMMUTABLE|No  |**Yes**   |**Yes**   |
|IMAGE SIZE	|Big GBs  |**Small MBs**   |**Small MBs**   |
|EXISTING INFRASTRUCTURE ROI|-  |No  |**Great**  |
|TOOLCHAIN MATURITY	|**Great**  |Brand new   |**Great**  |

### Container Resource Limits
- Max open files: 1000000:1000000
- Max processes: 30604:30604
- Max pending signals: 30604:30604

> NOTE: These values can be overwritten by setting `rlimit` in the container.
