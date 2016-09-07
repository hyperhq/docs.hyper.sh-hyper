# Network

Networking is easy with Hyper\_. All containers of a user will be automatically placed in the user's own network. Containers in the same network are reachable to each other but isolated from other networks. In technical terms, Hyper\_ setup a Layer-2 virtual private network for every user.

Containers are able to access the Internet, but can not be accessed by the public. This makes your containers more secure as you can't accidently expose an important part of your infrastructure to the public. (To enable the public access, you have to use a [floating IP](./fip.md) pointed to the container).

## Example

In this example, let us try to connect from one container to another. First, we create a container with an easy hostname.

```
$ hyper run --hostname mycontainer -d nginx
```

Then because we set the hostname to `mycontainer`, we can then ping it from another container.

```
$ hyper run alpine ping mycontainer
PING mycontainer (172.16.0.119): 56 data bytes
64 bytes from 172.16.0.119: seq=0 ttl=64 time=0.469 ms
```

And that is how easy you can use the network on Hyper_.

## Default network configuration

When a new container is launched, Hyper\_ will automatically assign a private IP address to the container. There is currently no way to control the IP allocation.

The [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) of the default private network is set to `172.16.0.0/16`. Note: Hyper\_ reserves a few addresses for its own usage.
