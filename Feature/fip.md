# Floating IP

A floating IP or also called FIP, is a public accessible IP address that can be associated to one container. A Floating IP can also be remapped to other containers in the same region, and can be used this way to switch between different deployments.

You need to allocate new free IPs before assigning them to containers:

    $ hyper fip allocate 1
    52.68.129.19
    $ hyper fip attach 52.68.129.19 myweb
    myweb

To detach a floating IP from a container:

    $ hyper fip detach web
    52.68.129.19

If you want to move the floating ip from one container to another, you must first detach it from the old container and then attach it again like this:

    $ hyper fip detach myweb && hyper fip attach 52.68.129.19 myweb2

## Deleting Floating IP's

When you `rm` a container, the floating IP will be automatically detached.

You can also release the ip if there is no container attached:

    $ hyper fip release 52.68.129.19
    52.68.129.19

> NOTE: floating IP is priced at a monthly rate. When an IP is allocated, you will be charged for that current month.

## Floating IP's when stopping and restarting containers

When a container is stopped or restarted, the floating IP (if any) is still attached with the container, which means that when you (re)start the container, you don't need to attach the floating IP again.

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
