## fip_release

    Usage: hyper fip release [OPTIONS] IP [IP...]

    Release a fip

      --help=false       Print usage

Release one or more floating IP

    $ hyper fip release 211.98.26.102
    211.98.26.102

The floating IP to be released must not be associated with any container. Otherwise, Hyper returns an error:

	$ hyper fip release 211.98.26.102
	211.98.26.102 is in use
