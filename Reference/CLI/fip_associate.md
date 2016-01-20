
## fip_associate

    Usage: hyper fip associate [OPTIONS] IP CONTAINER

    Associate floating IP to container

      --help=false         Print usage

Associate an allocated floating IP to a running container:

	$ hyper fip associate 211.98.26.102 myweb
	myweb

If you attempt to associate the floating IP to a stopped container, Hyper return an error:

	$ hyper fip associate 211.98.26.102 myweb
	myweb is stopped

Each container can have only one floating IP. Trying to associate another floating IP will return an error:

	$ hyper fip associate 211.98.26.102 myweb
	myweb is associated with 211.98.26.101
