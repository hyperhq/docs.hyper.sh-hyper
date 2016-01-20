## exec

    Usage: hyper exec [OPTIONS] CONTAINER COMMAND [ARG...]

    Run a command in a running container

      -d, --detach=false         Detached mode: run command in the background
      --help=false               Print usage
      -i, --interactive=false    Keep STDIN open even if not attached
      -u, --user=                Username or UID (format: <name|uid>[:<group|gid>])

The `hyper exec` command runs a new command in a running container.

~~The command started using `hyper exec` only runs while the container's primary process (`PID 1`) is running~~, and it is not restarted if the container is restarted.

### Examples

    $ hyper run --name ubuntu_bash --rm -i -t ubuntu bash

This will create a pod named `ubuntu_bash` and start a Bash session.

    $ hyper exec -d ubuntu_bash touch /tmp/execWorks

This will create a new file `/tmp/execWorks` inside the default (only) container in the running pod `ubuntu_bash`, in the background.

    $ hyper exec -it ubuntu_bash bash

This will create a new Bash session in the pod `ubuntu_bash`.
