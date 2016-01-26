# Why Hyper_?

- **Secure Container** - Hyper_ uses Intel VT technology to apply the hardware-enforced isolation in containers. Each container runs on its own, independant kernel, instead of sharing the host one. As such, containers enjoy the same-level security of VMs in Hyper_.

- **Native Docker Workflow** - Try imagining Hyper_ as a gigantic laptop in the cloud. Developers are offered the same and workflow to run containers on it, as they do on their laptop!

		$ hyper pull nginx mysql
		$ hyper run mysql
		$ hyper run nginx --link mysql
		$ hyper exec nginx /bin/sh

- **5 seconds deployment** - From issuing `hyper run` till the point that the container is running, it takes only 5 seconds in Hyper_. Application is able to instantly response to the workload changes. 

- **Per Second Billing** - Pricing is per second consumed in Hyper_. Combined with the 5-seconds-deployment, Hyper_ offers great significant cost savings, empowering developers to build **truly on-demand applications**, e.g. Event-driven (AWS Lamda), Big Data, CD/CI, etc.

- **SSD** – Hyper_ uses high-speed SSD to run all containers. 

- **10GB Network** - Hyper_ uses the lastest high-performance 10GB Ethernet for both in/outbound and internal traffic.

- **Cloud Portability** – By adhering open standards, we ensure seamless application migration between Hyper_ and other container environments. This also help Hyper_ to be the best candidate for your hybrid cloud.
