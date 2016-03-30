## associate

    Usage: hyper fip associate [OPTIONS] FIP CONTAINER

    Associate floating IP to a (running) container

      --help=false         Print usage

Associate an allocated floating IP to a (running) container:

	$ hyper fip associate 211.98.26.102 myweb
	myweb

If you attempt to associate the floating IP to a running container, Hyper_ return an error:

	$ hyper fip associate 211.98.26.102 myweb
	myweb is not running

Each container can have only one floating IP. Trying to associate another floating IP will return an error:

	$ hyper fip associate 211.98.26.102 myweb
	myweb is associated with 211.98.26.101
