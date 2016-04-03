## exec

    Usage: hyper exec [OPTIONS] CONTAINER COMMAND [ARG...]

    Run a command in a running container

                -d, --detach=false         Detached mode: run command in the background
                --help=false               Print usage
                TBD-t, --tty                  Allocate a pseudo-TTY
                -i, --interactive=false    Keep STDIN open even if not attached

The `hyper exec` command runs a new command in a running container.

### Examples

    $ hyper run --name ubuntu_bash --rm -i -t ubuntu bash

This will create a container named `ubuntu_bash` and start a Bash session.

    $ hyper exec -d ubuntu_bash touch /tmp/execWorks

This will create a new file `/tmp/execWorks` inside the default (only) container in the running container `ubuntu_bash`, in the background.

    $ hyper exec -it ubuntu_bash bash

This will create a new Bash session in the container `ubuntu_bash`.
