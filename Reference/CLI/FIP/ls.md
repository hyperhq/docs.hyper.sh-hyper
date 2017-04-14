## fip ls

    Usage: hyper fip ls [OPTIONS]

    List snapshots

      -f, --filter=[]      Provide filter values (i.e. 'dangling=true')
      --help=false         Print usage
      -q, --quiet=false    Only display floating ip addresses

Lists all the floating ips Hyper knows about. You can filter using the `-f` or `--filter` flag. The filtering format is a `key=value` pair.

There is a single supported filter `dangling=value` which takes a boolean of `true` or `false`.

Example output:

    $ hyper fip ls
    Floating IP         Container                                                           Service
    211.98.26.102
    211.98.26.104       aa733d1782c92f295ff7291817b92c37938274b5e9fc3f4202c13f2db246192b
    211.98.26.103                                                                           http
