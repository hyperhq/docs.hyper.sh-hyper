## disassociate

    Usage: hyper fip disassociate [OPTIONS] CONTAINER

   Deassociate the floating IP from a (stopped) conainer

      --help=false         Print usage

Deassociate the floating IP from a (stopped) container:

	$ hyper disassociate myweb
	211.98.26.102

If you attempt to disassociate from a running container, Hyper_ return an error:

	$ hyper disassociate myweb
	myweb is not stopped

If you attempt to disassociate from a container with no floating IP, Hyper_ return an error:

	$ hyper disassociate myweb
	No floating IP associated
