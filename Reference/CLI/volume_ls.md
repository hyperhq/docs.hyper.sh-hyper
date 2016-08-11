#### volume_ls

    Usage: hyper volume ls [OPTIONS]

    List volumes

      -f, --filter=[]      Provide filter values (i.e. 'dangling=true')
      --help=false         Print usage
      -q, --quiet=false    Only display volume names

Lists all the volumes Hyper_ knows about. You can filter using the `-f` or `--filter` flag. The filtering format is a `key=value` pair. To specify more than one filter,  pass multiple flags (for example,  `--filter "foo=bar" --filter "bif=baz"`)

There is a single supported filter `dangling=value` which takes a boolean of `true` or `false`.

Example output:

    $ hyper volume create --name rose
    rose
    $ hyper volume create --name tyler --size=50
    tyler
    $ hyper volume ls
	DRIVER              VOLUME NAME         SIZE                CONTAINER
	hyper               rose                10g
	hyper               tyler               50g
