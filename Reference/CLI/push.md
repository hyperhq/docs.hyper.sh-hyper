## push

    Usage: hyper push [OPTIONS] NAME[:TAG]

    Push an image or a repository to the registry

      --disable-content-trust=true   Skip image signing
      --help=false                   Print usage

Use `hyper push` to share your images to the [Docker Hub](https://hub.docker.com) registry or to a self-hosted one.

### Examples

#### Push a new image to a registry

First save the new image by finding the container ID (using [`hyper ps -a`]
and then committing it to a new image name.  Note that only `a-z0-9-_.` are
allowed when naming images:

```bash
$ hyper commit 50d6ab76a13a user/testimage:v1
```

Now, push the image to the registry using the image ID. In this example the
registry is Docker Hub.

```bash

$ hyper push user/testimage:v1
```

Check that this worked by running:

```bash
$ hyper images
```

You should see `user/testimage:v1` listed.
