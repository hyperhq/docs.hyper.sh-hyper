## mount

    Usage: hyper mount [OPTIONS] CONTAINER -v VOLUME -d DIR -p PERMISSION

    Mount a volume to a (stopped) container

      --help=false         Print usage
      --volume=			   The volume ID
      --dir=               The mountpoint path
      --perm=			   The mountpoint permission (non-recursive), e.g. 0755
      --force			   Force to mount when the mountpoint is present

Mount a volume to a (stopped) container:

	$ hyper mount myweb -v vol-dl1249x4 -d /data -p 0755
	/data

If the mount point is present in the container, you need to use `--force` flag. Otherwise, Hyper.sh return an error:

	$ hyper mount myweb -v vol-dl1249x4 -d /data -p 0755
	/data already exists
