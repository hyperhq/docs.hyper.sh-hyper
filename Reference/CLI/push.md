## push

    Usage: hyper push [OPTIONS] NAME[:TAG]

    Push an image or a repository to the registry

      --disable-content-trust=true   Skip image signing
      --help=false                   Print usage

Use `hyper push` to share your images to the [Docker Hub](https://hub.docker.com) registry or to a self-hosted one.

Killing the `hyper push` process, for example by pressing `CTRL-c` while it is running in a terminal, will terminate the push operation.