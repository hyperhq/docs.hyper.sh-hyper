#### snapshot_ls

    Usage: hyper snapshot ls [OPTIONS]

    List snapshots

      -f, --filter=[]      Provide filter values (i.e. 'dangling=true')
      --help=false         Print usage
      -q, --quiet=false    Only display snapshot names

Lists all the snapshots Hyper knows about. You can filter using the `-f` or `--filter` flag. The filtering format is a `key=value` pair. To specify more than one filter,  pass multiple flags (for example,  `--filter "foo=bar" --filter "bif=baz"`)

There is a single supported filter `dangling=value` which takes a boolean of `true` or `false`.

Example output:

    $ hyper volume snapshot dbvol --name rose
    rose
    $ hyper volume snapshot dbvol --name tyler
    tyler
    $ hyper snapshot ls
    ID              	SIZE	NAME			
    snapshot-g9u3d4dp   10	rose
    snapshot-bbnmk143   100	tyler
