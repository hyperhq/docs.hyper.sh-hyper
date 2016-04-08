## disassociate

    Usage: hyper fip disassociate [OPTIONS] CONTAINER

   Disassociate the floating IP from a conainer

      --help=false         Print usage

Disassociate the floating IP from a container:

	$ hyper disassociate myweb
	211.98.26.102

If you attempt to disassociate from a container with no floating IP, Hyper_ return an error:

	$ hyper disassociate myweb
	No floating IP associated
