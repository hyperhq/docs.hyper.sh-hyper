## exec

    Usage: hyper exec [OPTIONS] CONTAINER COMMAND [ARG...]

    Run a command in a running container

                -d, --detach=false         Detached mode: run command in the background
                --help=false               Print usage
                -t, --tty                  Allocate a pseudo-TTY
                -i, --interactive=false    Keep STDIN open even if not attached

The `hyper exec` command runs a new command in a running container.

### Examples

    $ hyper run --name ubuntu-bash --rm -i -t ubuntu bash

This will create a container named `ubuntu-bash` and start a Bash session.

    $ hyper exec -d ubuntu-bash touch /tmp/execWorks

This will create a new file `/tmp/execWorks` inside the default (only) container in the running container `ubuntu-bash`, in the background.

    $ hyper exec -it ubuntu-bash bash

This will create a new Bash session in the container `ubuntu-bash`.
