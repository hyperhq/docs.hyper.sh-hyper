# Network

Hyper_ setup a Layer-2 virtual network for each user. All containers of a user will be automatically placed in the user's own network, and isolated from others' and the Internet. The default network is set to the [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) range of `172.16.0.0/16`. Hyper_ reserves a few addresses for its own usage, and all containers will be automatically assigned a private IP address.

