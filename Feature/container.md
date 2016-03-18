# Container

When a `hyper run` command is fired, a new container will be launched on your behalf. Since Hyper_ applies the VM-level isolation to containers, there is no need to "bring your own VM". Thus, you can simply launch as many containers as you want, without preparing anything.

    $ hyper run ubuntu /bin/sh
    
You can stop a running container, and start it later.  Hyper_ does not charge for stopped containers, except for the storage space. 


Container is the 
Whenever you launch a Docker image in Hyper_, a new virtualized container will be initiated. The container runs on top of [hyperd](github.com/hyperhq/hyperd) technology, which leverages hypervisor as the isolation mechanism.

Hyper_ launches your

Therefore, your workload is secured 