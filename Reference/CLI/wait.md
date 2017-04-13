## wait

    Usage:  hyper wait [OPTIONS] CONTAINER [CONTAINER...]

    Block until a container stops, then print its exit code

      --help             Print usage

### Examples
Start a container in the background.

    $ hyper run -d --name=my_container ubuntu bash

Run `hyper wait`, which should block until the container exits.

    $ hyper wait my_container

In another terminal, stop the first container. The `hyper wait` command above returns the exit code.

    $ hyper stop my_container

This is the same `hyper wait` command from above, but it now exits, returning 0.

    $ hyper wait my_container
    0
