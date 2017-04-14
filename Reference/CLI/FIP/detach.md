## fip detach

    Usage: hyper fip detach [OPTIONS] CONTAINER

   Detach the floating IP from a conainer

      --help=false         Print usage

Detach the floating IP from a container:

	$ hyper fip detach myweb
	211.98.26.102

If you attempt to remove from a container with no floating IP, Hyper.sh return an error:

	$ hyper fip detach myweb
	No floating IP attached
