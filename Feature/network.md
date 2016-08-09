# Network

Networking is easy with Hyper\_. All containers of a user will be automatically placed in the user's own network. Containers in the same network are reachable to each other, but isolated from other networks. In technical terms, Hyper\_ setup a Layer-2 virtual private network for every user.

Containers are able to access the Internet, but can not be acceessed by the public. This makes your containers more secure as you can't accidently expose an important part of your infrastructure to the public. (To enable the public access, you have to use a [floating IP](./fip.md) pointed to the container).

## Default network configuration

When a new container is launched, Hyper\_ will automatically assign a private IP address to the container. There is currently no way to control the IP allocation.

The [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) of the default private network is set to `172.16.0.0/16`. Note: Hyper\_ reserves a few addresses for its own usage.
