#### snpapshot_create

    Usage: hyper snapshot create [OPTIONS]

    Create a snapshot from a volume
    
    -f, --force               Force to create snapshot
        --help=false          Print usage
        --name=               Specify snapshot name
    -v, --volume              Specify volume to create snapshot

Creates a new snapshot from a volume. If a name is not specified, Hyper_ generates a random id:

	$ hyper snapshot create --name db-snapshot db-vol
	db-snapshot

You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your volume at the time the snapshot command is issued. This might exclude any data that has been cached by the container. Tto ensure a consistent and complete snapshot, you should stop the container, issue the snapshot command, and then start the container.

Snapshot names must be unique.  This means you cannot use the same snapshot name with two different snapshots.  If you attempt this `hyper` returns an error:

```
A snapshot named  "db-snapshot"  already exists. Choose a different snapshot name.
```
