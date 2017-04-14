## snapshot ls

    Usage: hyper snapshot ls [OPTIONS]

    List snapshots

      --help=false         Print usage
      -q, --quiet=false    Only display snapshot names


Example output:

    $ hyper snapshot create --volume dbvol --name rose
    rose
    $ hyper snapshot create --volume dbvol --name tyler
    tyler
    $ hyper snapshot ls
	Snapshot Name       Volume              Size
	rose        		dbvol               20
	tyler        		dbvol               20
