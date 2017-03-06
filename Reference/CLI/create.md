## create

    Usage: hyper create [OPTIONS] IMAGE [COMMAND] [ARG...]

    Create a new container

              -a, --attach=[]                 Attach to STDIN, STDOUT or STDERR
              --cidfile                       Write the container ID to the file
              --disable-content-trust=true    Skip image verification
              -e, --env=[]                    Set environment variables
              --entrypoint                    Overwrite the default ENTRYPOINT of the image
              --env-file=[]                   Read in a file of environment variables
              --expose=[]                     Expose a port or a range of ports
              -h, --hostname                  Container host name
              --help                          Print usage
              -i, --interactive               Keep STDIN open even if not attached
              -l, --label=[]                  Set meta data on a container
              --label-file=[]                 Read in a line delimited file of labels
              --link=[]                       Add link to another container
              --name                          Assign a name to the container (max length: 48)
              --noauto-volume                 Do not create volumes specified in image
              -P, --publish-all               Publish all exposed ports
              -p, --publish=[]                Publish a container's port(s)
              --protection=false              Termination protection for container
              --restart=no                    Restart policy to apply when a container exits
              --sg=[]                         Security group for each container
              --size=s4                       The type for each instance (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
              --stop-signal=SIGTERM           Signal to stop a container, SIGTERM by default
              -t, --tty                       Allocate a pseudo-TTY
              -v, --volume=[]                 Bind mount a volume
	      --volumes-from=[]               Mount shared volumes from the specified container(s)
              -w, --workdir                   Working directory inside the container

The `hyper create` command creates a writeable container layer over the
specified image and prepares it for running the specified command.  The
container ID is then printed to `STDOUT`.  This is similar to `hyper run -d`
except the container is never started.  You can then use the
`hyper start <container_id>` command to start the container at any point.

This is useful when you want to set up a container configuration ahead of time
so that it is ready to start when you need it. The initial status of the
new container is `created`.

Please see the [run command](./run.md) section for more details.

## Examples

    $ hyper create -t -i fedora bash
    6d8af538ec541dd581ebc2a24153a28329acb5268abe5ef868c1f1a261221752
    $ hyper start -a -i 6d8af538ec5
    bash-4.2#

Container volumes are initialized during the `hyper create` phase
(i.e., `hyper run` too). For example, this allows you to `create` the `data`
volume container, and then use it from another container:

    $ hyper create -v /data --name data ubuntu
    240633dfbb98128fa77473d3d9018f6123b99c454b3251427ae190a7d951ad57
    $ hyper run --rm ubuntu ls -la /data
    total 8
    drwxr-xr-x  2 root root 4096 Dec  5 04:10 .
    drwxr-xr-x 48 root root 4096 Dec  5 04:11 ..

