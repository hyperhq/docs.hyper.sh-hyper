## create

    Usage: hyper create [OPTIONS] IMAGE [COMMAND] [ARG...]

    Create a new pod with one or more containers

      -a, --attach=[]               Attach to STDIN, STDOUT or STDERR
      --add-host=[]                 Add a custom host-to-IP mapping (host:ip)
      -d, --detach=false            Run container in background and print container ID
      --disable-content-trust=true  Skip image verification
      --dns=[]                      Set custom DNS servers
      --dns-opt=[]                  Set custom DNS options
      --dns-search=[]               Set custom DNS search domains
      -e, --env=[]                  Set environment variables
      --entrypoint=""               Overwrite the default ENTRYPOINT of the image
      --env-file=[]                 Read in a file of environment variables
      --expose=[]                   Expose a port or a range of ports
      --group-add=[]                Add additional groups to run as
      -h, --hostname=""             Container host name
      --help=false                  Print usage
      -i, --interactive=false       Keep STDIN open even if not attached
      -l, --label=[]                Set metadata on the container (e.g., --label=com.example.key=value)
      --label-file=[]               Read in a file of labels (EOL delimited)
      --link=[]                     Add link to another container
       --log-opt=[]                  Log driver specific options
      --name=""                     Assign a name to the container
      -P, --publish-all=false       Publish all exposed ports to random ports
      -p, --publish=[]              Publish a container's port(s) to the host
      --read-only=false             Mount the container's root filesystem as read only
      --restart="no"                Restart policy (no, on-failure[:max-retry], always, unless-stopped)
      --rm=false                    Automatically remove the container when it exits
      --shm-size=[]                 Size of `/dev/shm`. The format is `<number><unit>`. `number` must be greater than `0`.  Unit is optional and can be `b` (bytes), `k` (kilobytes), `m` (megabytes), or `g` (gigabytes). If you omit the unit, the system uses bytes. If you omit the size entirely, the system uses `64m`.
      -v, --volume=[host-src:]container-dest[:<options>]
                                    Bind mount a volume. The comma-delimited
                                    `options` are [rw|ro], [z|Z], or
                                    [[r]shared|[r]slave|[r]private]. The
                                    'host-src' is an absolute path or a name
                                    value.
      -w, --workdir=""              Working directory inside the container

