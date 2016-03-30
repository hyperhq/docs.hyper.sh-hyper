# Floaing IP

A floating IP is a publicly-accessible IP address that can be assigned to one container. Floating IPs can be remapped to other containers in the same region, to mask the failure of container or application. 

You need to allocate new free IPs before assigning them to containers:

    $ hyper fip allocate 4
    52.68.129.19
    52.68.129.20
    52.68.129.21
    52.68.129.22
    $ hyper fip associate 52.68.129.19 myweb
    myweb

To de-associate a floating IP from a running container:

    $ hyper fip deassociate myweb
    52.68.129.19
    
When a container is stopped, the associated floating IP (if any) will be automatically de-associated, which means that when you start the container, you need to associate the IP again:
    
    $ hyper stop myweb
    myweb
    (52.68.129.19 is free)
    $ hyper start myweb
    $ hyper fip associate 52.68.129.19 myweb
    myweb

NOTE: when a container is restarted, the floating IP will remain associated.

To release a floating IP:

    $ hyper fip release 52.68.129.19
    52.68.129.19

> NOTE: floating IP is priced at a monthly rate: $1/month. When an IP is allocated, you will be charged for that current month. And ~~TODO~~
