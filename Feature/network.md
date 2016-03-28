# Network

Hyper\_ setup a default Layer-2 virtual network for every user. All containers of a user will be automatically placed in the user's own network. Containers in the same network are reachable to each other, but isolated from other networks. Also, container is able to access the Internet, but not accessible on Internet, be default (To enable the public access, you can associate [floating IP](./fip.md) to container).


The [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) of this default network is set to `172.16.0.0/16`, though Hyper\_ reserves a few addresses for its own usage. When a new container is launched, Hyper\_ will automatically assign a private IP address to the container.



