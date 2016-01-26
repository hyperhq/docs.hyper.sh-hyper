## run

    Usage: hyper run [OPTIONS] IMAGE [COMMAND] [ARG...]

    Run a new pod with one or more containers

      -a, --attach=[]               Attach to STDIN, STDOUT or STDERR
      --add-host=[]                 Add a custom host-to-IP mapping (host:ip)
      --cpu-count=1                 CPU count
      --cpuset-cpus=""              CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems=""              Memory nodes (MEMs) in which to allow execution (0-3, 0,1)
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
      -m, --memory=""               Memory limit
      --mac-address=""              Container MAC address (e.g. 92:d0:c6:0a:29:33)
      --memory-reservation=""       Memory soft limit
      --memory-swap=""              Total memory (memory + swap), '-1' to disable swap
      --memory-swappiness=""        Tune a container's memory swappiness behavior. Accepts an integer between 0 and 100.
      --name=""                     Assign a name to the container
      -P, --publish-all=false       Publish all exposed ports to random ports
      -p, --publish=[]              Publish a container's port(s) to the host
      --read-only=false             Mount the container's root filesystem as read only
      --restart="no"                Restart policy (no, on-failure[:max-retry], always, unless-stopped)
      --rm=false                    Automatically remove the container when it exits
      --shm-size=[]                 Size of `/dev/shm`. The format is `<number><unit>`. `number` must be greater than `0`.  Unit is optional and can be `b` (bytes), `k` (kilobytes), `m` (megabytes), or `g` (gigabytes). If you omit the unit, the system uses bytes. If you omit the size entirely, the system uses `64m`.
      --sig-proxy=true              Proxy received signals to the process
      --stop-signal="SIGTERM"       Signal to stop a container
      -u, --user=""                 Username or UID (format: <name|uid>[:<group|gid>])
      --ulimit=[]                   Ulimit options
      -v, --volume=[host-src:]container-dest[:<options>]
                                    Bind mount a volume. The comma-delimited
                                    `options` are [rw|ro], [z|Z], or
                                    [[r]shared|[r]slave|[r]private]. The
                                    'host-src' is an absolute path or a name
                                    value.
      -w, --workdir=""              Working directory inside the container

The `hyper run` command first `creates` a writeable container layer over the specified image, and then `starts` it using the specified Docker images. That is, `hyper run` is equivalent to the API `/pod/create` then `/pod/(id)/start`. A stopped container can be restarted with all its previous changes intact using `hyper start`. See `hyper ps -a` to view a list
of all containers.

The `hyper run` command can be used in combination with `hyper commit` to
[*change the command that a container runs*](commit.md). There is additional detailed information about `docker run` in the [Docker run reference](../run.md).

### Examples

#### Set working directory (-w)

    $ hyper run -w /path/to/dir/ -i -t ubuntu pwd

The `-w` lets the command being executed inside directory given, here
`/path/to/dir/`. If the path does not exists it is created inside the container.

> Note: this works when there is only one Docker image in the pod

#### Mount volume (-v, --read-only)

    $ hyper run -d -v hello:/world busybox ls /world

The mount is created inside the container's `/world` directory. Hyper does not support relative paths for mount points inside the container.

#### Publish or expose port (-p, --expose)

    $ docker run --expose 80 ubuntu bash

This exposes port `80` of the pod.

#### Set environment variables (-e, --env, --env-file)

    $ hyper run -e MYVAR1 --env MYVAR2=foo --env-file ./env.list ubuntu bash

This sets environmental variables in the container. For illustration all three flags are shown here. Where `-e`, `--env` take an environment variable and value, or if no `=` is provided, then that variable's current value is passed through (i.e. `$MYVAR1` from the host is set to `$MYVAR1` in the container). When no `=` is provided and that variable is not defined in the client's
environment then that variable will be removed from the container's list of environment variables. All three flags, `-e`, `--env` and `--env-file` can be repeated.

Regardless of the order of these three flags, the `--env-file` are processed first, and then `-e`, `--env` flags. This way, the `-e` or `--env` will override variables as needed.

    $ cat ./env.list
    TEST_FOO=BAR
    $ hyper run --env TEST_FOO="This is a test" --env-file ./env.list busybox env | grep TEST_FOO
    TEST_FOO=This is a test

The `--env-file` flag takes a filename as an argument and expects each line to be in the `VAR=VAL` format, mimicking the argument passed to `--env`. Comment lines need only be prefixed with `#`

An example of a file passed with `--env-file`

    $ cat ./env.list
    TEST_FOO=BAR

    # this is a comment
    TEST_APP_DEST_HOST=10.10.0.127
    TEST_APP_DEST_PORT=8888
    _TEST_BAR=FOO
    TEST_APP_42=magic
    helloWorld=true
    123qwe=bar
    org.spring.config=something

    # pass through this variable from the caller
    TEST_PASSTHROUGH
    $ TEST_PASSTHROUGH=howdy docker run --env-file ./env.list busybox env
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    HOSTNAME=5198e0745561
    TEST_FOO=BAR
    TEST_APP_DEST_HOST=10.10.0.127
    TEST_APP_DEST_PORT=8888
    _TEST_BAR=FOO
    TEST_APP_42=magic
    helloWorld=true
    TEST_PASSTHROUGH=howdy
    HOME=/root
    123qwe=bar
    org.spring.config=something

    $ hyper run --env-file ./env.list busybox env
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    HOSTNAME=5198e0745561
    TEST_FOO=BAR
    TEST_APP_DEST_HOST=10.10.0.127
    TEST_APP_DEST_PORT=8888
    _TEST_BAR=FOO
    TEST_APP_42=magic
    helloWorld=true
    TEST_PASSTHROUGH=
    HOME=/root
    123qwe=bar
    org.spring.config=something

#### Set metadata on pod(-l, --label, --label-file)

A label is a `key=value` pair that applies metadata to a pod. To label a pod with two labels:

    $ hyper run -l my-label --label com.example.foo=bar ubuntu bash

The `my-label` key doesn't specify a value so the label defaults to an empty string(`""`). To add multiple labels, repeat the label flag (`-l` or `--label`).

The `key=value` must be unique to avoid overwriting the label value. If you specify labels with identical keys but different values, each subsequent value overwrites the previous. Docker uses the last `key=value` you supply.

Use the `--label-file` flag to load multiple labels from a file. Delimit each label in the file with an EOL mark. The example below loads labels from a labels file in the current directory:

    $ hyper run --label-file ./labels ubuntu bash

The label-file format is similar to the format for loading environment variables. (Unlike environment variables, labels are not visible to processes running inside a container.) The following example illustrates a label-file format:

    com.example.label1="a label"

    # this is a comment
    com.example.label2=another\ label
    com.example.label3

You can load multiple label-files by supplying multiple  `--label-file` flags.

~~For additional information on working with labels, see [*Labels - custom metadata in Docker*](../../userguide/labels-custom-metadata.md) in the Docker User Guide.~~

#### Attach to STDIN/STDOUT/STDERR (-a)

The `-a` flag tells `hyper run` to bind to the pod's `STDIN`, `STDOUT` or `STDERR`. This makes it possible to manipulate the output and input as needed.

    $ echo "test" | hyper run -i -a stdin ubuntu cat -

This pipes data into a pod and prints the pod's ID by attaching only to the pod's `STDIN`.

    $ hyper run -a stderr ubuntu echo test

This isn't going to print anything unless there's an error because we've only attached to the `STDERR` of the pod. The pod's logs
still store what's been written to `STDERR` and `STDOUT`.

    $ cat somefile | hyper run -i -a stdin mybuilder dobuild

This is how piping a file into a container could be done for a build. The pod's ID will be printed after the build is done and the build logs could be retrieved using `hyper logs`. This is useful if you need to pipe a file or something else into a pod and
retrieve the pod's ID once the pod has finished running.

#### Restart policies (--restart)

Use Hyper's `--restart` to specify a pod's *restart policy*. A restart policy controls whether to restart a pod after exit.
Hyper supports the following restart policies:

<table>
  <thead>
    <tr>
      <th>Policy</th>
      <th>Result</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>no</strong></td>
      <td>
        Do not automatically restart the pod when it exits. This is the
        default.
      </td>
    </tr>
    <tr>
      <td>
        <span style="white-space: nowrap">
          <strong>on-failure</strong>[:max-retries]
        </span>
      </td>
      <td>
        Restart only if the pod exits with a non-zero exit status.
        Optionally, limit the number of restart retries
      </td>
    </tr>
    <tr>
      <td><strong>always</strong></td>
      <td>
        Always restart the pod regardless of the exit status.
        When you specify always, Hyper will try to restart
        the pod indefinitely. The pod will also always start
        on daemon startup, regardless of the current state of the pod.
      </td>
    </tr>
    <tr>
      <td><strong>unless-stopped</strong></td>
      <td>
        Always restart the pod regardless of the exit status, but
        do not start it on daemon startup if the pod has been put
        to a stopped state before.
      </td>
    </tr>
  </tbody>
</table>

    $ hyper run --restart=always redis

This will run the `redis` pod with a restart policy of **always**
so that if the pod exits, Docker will restart it.

#### Add entries to pod hosts file (--add-host)

You can add other hosts into a pod's `/etc/hosts` file by using one or more `--add-host` flags. This example adds a static address for a host named `docker`:

    $ hyper run --add-host=web:10.180.0.1 --rm -it debian
    $$ ping web
    PING docker (10.180.0.1): 48 data bytes
    56 bytes from 10.180.0.1: icmp_seq=0 ttl=254 time=7.600 ms
    56 bytes from 10.180.0.1: icmp_seq=1 ttl=254 time=30.705 ms
    ^C--- web ping statistics ---
    2 packets transmitted, 2 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 7.600/19.152/30.705/11.553 ms

#### Set ulimits in pod (--ulimit)

`--ulimit` is specified with a soft and hard limit as such: `<type>=<soft limit>[:<hard limit>]`, for example:

    $ hyper run --ulimit nofile=1024:1024 --rm debian ulimit -n
    1024

> **Note:**
> If you do not provide a `hard limit`, the `soft limit` will be used for both values. If no `ulimits` are set, they will be inherited from the default `ulimits`.  `as` option is disabled now. In other words, the following script is not supported: `$ hyper run -it --ulimit as=1024 fedora /bin/bash`

The values are sent to the appropriate `syscall` as they are set. Hyper doesn't perform any byte conversion. Take this into account when setting the values.

##### For `nproc` usage

Be careful setting `nproc` with the `ulimit` flag as `nproc` is designed by Linux to set the maximum number of processes available to a user, not to a pod.  For example, start four pods with `daemon` user:

    hyper run -d -u daemon --ulimit nproc=3 busybox top
    hyper run -d -u daemon --ulimit nproc=3 busybox top
    hyper run -d -u daemon --ulimit nproc=3 busybox top
    hyper run -d -u daemon --ulimit nproc=3 busybox top

The 4th pod fails and reports "[8] System error: resource temporarily unavailable" error. This fails because the caller set `nproc=3` resulting in the first three containers using up the three processes quota set for the `daemon` user.

#### Stop pod with signal (--stop-signal)

The `--stop-signal` flag sets the system call signal that will be sent to the pod to exit. This signal can be a valid unsigned number that matches a position in the kernel's syscall table, for instance 9, or a signal name in the format SIGNAME, for instance SIGKILL.
