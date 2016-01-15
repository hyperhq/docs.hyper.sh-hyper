
## fip_deassociate

    Usage: hyper fip deassociate [OPTIONS] CONTAINER

   Deassociate floating IP from conainer

      --help=false         Print usage

Deassociate an floating IP from a running container:

	$ hyper fip deassociate myweb
	211.98.26.102

If you attempt to deassociate a stopped container or a running container with no floating IP, Hyper return an error:

	$ hyper fip deassociate myweb
	No floating IP associated
