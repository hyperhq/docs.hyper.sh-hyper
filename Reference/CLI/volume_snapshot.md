#### volume_snapshot

    Usage: hyper volume snapshot [OPTIONS] VOLUME

    Create a snapshot from a volume
    
      --help=false          Print usage
      --name=               Specify snapshot name

Creates a new snapshot from a volume. If a name is not specified, Hyper generates a random id:

	$ hyper volume snapshot --name hello
	snapshot-d3848dgk

You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your volume at the time the snapshot command is issued. This might exclude any data that has been cached by the container. Tto ensure a consistent and complete snapshot, you should stop the container, issue the snapshot command, and then start the container.

Snapshot names must be unique.  This means you cannot use the same snapshot name with two different snapshots.  If you attempt this `hyper` returns an error:

```
A snapshot named  "hello"  already exists. Choose a different snapshot name.
```
