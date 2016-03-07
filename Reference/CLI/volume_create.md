#### volume_create

    Usage: hyper volume create [OPTIONS]

    Create a volume
    
      --help=false          Print usage
      --name=               Specify volume name
      --size=               Specify volume size (a multiple of 10 GB, up to 1TB)
      --snapshot=           Specify snapshot id or name to restore

Creates a new volume that containers can consume and store data in. If a name is not specified, Hyper generates a random id. You create a volume and then configure the container to use it, for example:

    $ hyper volume create --name hello
    hello

You can also restore a snapshot to a new volume:

	$ hyper volume create --name new_vol --snapshot=snapshot-d3848dgk
	$ new_vol
	
The new volume's size is the same as the snapshot.

Volume names must be unique.  This means you cannot use the same volume name with two different volumes.  If you attempt this `hyper` returns an error:

```
A volume named  "hello"  already exists. Choose a different volume name.
```
