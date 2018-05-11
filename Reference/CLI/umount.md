## umount

    Usage: hyper umount [OPTIONS] CONTAINER -v VOLUME -d DIR

    Unmount a volume from a (stopped) container

      --help=false         Print usage
      --dir=               The mountpoint path

Unmount a volume from a (stopped) container:

	$ hyper umount myweb -d /data
	/data

If no volume is mounted at the mount point or the mount point is absent, Hyper return an error:

	$ hyper umount myweb -d /data
	No volume found
