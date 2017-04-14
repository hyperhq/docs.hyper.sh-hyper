## volume rm

    Usage: hyper volume rm [OPTIONS] VOLUME [VOLUME...]

    Remove a volume

      --help=false       Print usage

Removes one or more volumes. You cannot remove a volume that is in use by a container.

    $ hyper volume rm hello
    hello