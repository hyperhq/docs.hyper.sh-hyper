## deassociate

    Usage: hyper fip deassociate [OPTIONS] CONTAINER

   Deassociate the floating IP from a (stopped) conainer

      --help=false         Print usage

Deassociate the floating IP from a (stopped) container:

	$ hyper deassociate myweb
	211.98.26.102

If you attempt to deassociate from a running container, Hyper_ return an error:

	$ hyper deassociate myweb
	myweb is not stopped

If you attempt to deassociate from a container with no floating IP, Hyper_ return an error:

	$ hyper deassociate myweb
	No floating IP associated
