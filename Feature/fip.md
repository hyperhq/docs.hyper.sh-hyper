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

To de-associate a floating IP from a container:

    $ hyper fip disassociate myweb
    52.68.129.19
    
When a container is stopped or restarted, the floating IP (if any) is still associated with the container, which means that when you (re)start the container, you don't need to associate the floating IP again.
    
    $ hyper stop myweb
    myweb
    $ hyper ps -a
	CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                      NAMES               PUBLIC IP
	3259d441edae        ghost               "/entrypoint.sh npm s"   16 minutes ago      Exited (0) 4 seconds ago                               myweb          		23.236.114.91
    $ hyper start myweb
    myweb
    $ hyper ps -a
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                      NAMES               PUBLIC IP
	3259d441edae        ghost               "/entrypoint.sh npm s"   17 minutes ago      Up 4 seconds                0.0.0.0:2368->2368/tcp     myweb        		23.236.114.91

However, when you `rm` a container, the floating IP will be automatically de-associated.

To release a floating IP:

    $ hyper fip release 52.68.129.19
    52.68.129.19

> NOTE: floating IP is priced at a monthly rate. When an IP is allocated, you will be charged for that current month.
