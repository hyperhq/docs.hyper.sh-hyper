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
                --help                          Print usage
                -i, --interactive               Keep STDIN open even if not attached
                --size=xxs                      Container size (e.g. xxs, xs, s, m, l, xl, xxl)
                -l, --label=[]                  Set meta data on a container
                --label-file=[]                 Read in a line delimited file of labels
                --link=[]                       Add link to another container
                --log-driver                    Logging driver for container
                --log-opt=[]                    Log driver options
                --name                          Assign a name to the container
                --net=bridge                    Connect a container to a network
                --net-alias=[]                  Add network-scoped alias for the container
                -P, --publish-all               Publish all exposed ports to random ports
                -p, --publish=[]                Publish a container's port(s) to the host
                TBD--read-only                     Mount the container's root filesystem as read only
                --restart=no                    Restart policy to apply when a container exits
                TBD-t, --tty                       Allocate a pseudo-TTY
                TBD--tmpfs=[]                      Mount a tmpfs directory
                -v, --volume=[]                 Bind mount a volume
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

Similarly, `create` a volume bind mounted volume container, which can
then be used from the subsequent container:

    $ hyper create -v volume_name:/hyper --name hyper ubuntu
    9aa88c08f319cd1e4515c3c46b0de7cc9aa75e878357b1e96f91e2c773029f03
    $ hyper run --rm --volumes-from hyper ubuntu ls -la /hyper
    total 20
    drwxr-sr-x  5 1000 staff  180 Dec  5 04:00 .
    drwxr-xr-x 48 root root  4096 Dec  5 04:13 ..
    -rw-rw-r--  1 1000 staff 3833 Dec  5 04:01 .ash_history
    -rw-r--r--  1 1000 staff  446 Nov 28 11:51 .ashrc
    -rw-r--r--  1 1000 staff   25 Dec  5 04:00 .gitconfig
    drwxr-sr-x  3 1000 staff   60 Dec  1 03:28 .local
    -rw-r--r--  1 1000 staff  920 Nov 28 11:51 .profile
    drwx--S---  2 1000 staff  460 Dec  5 00:51 .ssh
    drwxr-xr-x 32 1000 staff 1140 Dec  5 04:01 hyper

