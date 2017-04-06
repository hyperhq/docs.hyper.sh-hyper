## func create

    Usage:	hyper func create [OPTIONS] IMAGE [COMMAND] [ARG...]

    Create a new function

        -e, --env=[]             Set environment variables
        --entrypoint             Overwrite the default ENTRYPOINT of the image
        --env-file=[]            Read in a file of environment variables
        --expose=[]              Expose a port or a range of ports
        --help                   Print usage
        -l, --label=[]           Set meta data on a container
        --label-file=[]          Read in a line delimited file of labels
        --link=[]                Add link to another container
        --name                   Function name
        --noauto-volume          Do not create volumes specified in image
        -P, --publish-all        Publish all exposed ports to random ports
        -p, --publish=[]         Publish a container's port(s) to the host
        --sg=[]                  Security group for each container
        --size=s4                The size of function containers to run the funciton (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
        --stop-signal=SIGTERM    Signal to stop a container, SIGTERM by default
        -t, --tty                Allocate a pseudo-TTY
        --timeout=300            The maximum execution duration of function call
        --volumes-from=[]        Mount shared volumes from the specified container(s)
        -w, --workdir            Working directory inside the container

Creates a new function with the specified image and options.

### Examples

**Create a function:**

    $ hyper func create --name helloworld ubuntu echo HelloWorld
    helloworld is created with the address of https://us-west-1.hyperfunc.io/call/helloworld/e62c014e-386c-42ea-8d07-41d44e98cc3d
