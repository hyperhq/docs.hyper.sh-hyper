
## fip_ls

    Usage: hyper fip ls [OPTIONS]

    List snapshots

      -f, --filter=[]      Provide filter values (i.e. 'dangling=true')
      --help=false         Print usage
      -q, --quiet=false    Only display floating ip addresses

Lists all the floating ips Hyper knows about. You can filter using the `-f` or `--filter` flag. The filtering format is a `key=value` pair. To specify more than one filter,  pass multiple flags (for example,  `--filter "foo=bar" --filter "bif=baz"`)

There is a single supported filter `dangling=value` which takes a boolean of `true` or `false`.

Example output:

    $ hyper fip allocate 2
    $ hyper fip ls
    Floating IP         Pod
    211.98.26.102       -
    211.98.26.192       c-08v8wq32