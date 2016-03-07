# Network

Hyper_ setup a Layer-2 virtual network for each user. All containers of a user will be automatically placed in the user's own network, and isolated from others' and the Internet. The default network is set to the [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) range of `172.16.0.0/16`. Hyper_ reserves a few addresses for its own usage, and all containers will be automatically assigned a private IP address.

## Floating IP

By default, all containers are able to access the Internet, but none is reachable from Internet. To enable the public access, you need to associate a floating (public) IP address to container:

    $ hyper fip allocate
    211.98.26.137
    $ hyper associate myweb 211.98.26.137
    myweb
    
And de-associate:

    $ hyper deassociate myweb
    211.98.26.137
