# Create a cron job

`POST /crons/create`

**Example request**:

```
POST /crons/create HTTP/1.1
Content-Type: application/json

{
    "Name": "test-cron-job",
    "Schedule": "*/5 * * * *",
    "ContainerName": "",
    "Config": {
        "Hostname": "",
        "Domainname": "",
        "AttachStdin": false,
        "AttachStdout": false,
        "AttachStderr": false,
        "Tty": false,
        "OpenStdin": false,
        "StdinOnce": false,
        "Env": [],
        "Cmd": [
            "ping",
            "-c",
            "3",
            "8.8.8.8"
        ],
        "Image": "busybox",
        "Volumes": {},
        "WorkingDir": "",
        "Entrypoint": [],
        "Labels": {
            "sh_hyper_instancetype": "s4"
        },
        "StopSignal": "SIGTERM"
    },
    "HostConfig": {
        "Binds": [],
        "NetworkMode": "bridge",
        "PortBindings": {},
        "RestartPolicy": {
            "Name": "no",
            "MaximumRetryCount": 0
        },
        "AutoRemove": false,
        "Links": [],
        "PublishAllPorts": false,
    },
    "NetConfig": {
        "EndpointsConfig": {}
    },
    "OwnerEmail": "",
}
```

**Example response**:

```
HTTP/1.1 201 Created
Content-Type: application/json

{
    "Name": "test-cron-job",
    "Schedule": "*/5 * * * *",
    "ContainerName": "",
    "Config": {
        "Hostname": "",
        "Domainname": "",
        "Env": [],
        "Cmd": [
            "ping",
            "-c",
            "3",
            "8.8.8.8"
        ],
        "Image": "busybox",
        "Volumes": {},
        "WorkingDir": "",
        "Entrypoint": [],
        "Labels": {
            "sh_hyper_instancetype": "s4"
        },
        "StopSignal": "SIGTERM"
    },
    "HostConfig": {
        "Binds": [],
        "NetworkMode": "bridge",
        "PortBindings": {},
        "RestartPolicy": {
            "Name": "no",
            "MaximumRetryCount": 0
        },
        "Links": [],
        "PublishAllPorts": false,
    },
    "NetConfig": {
        "EndpointsConfig": {}
    },
    "OwnerEmail": "xxx@hyper.sh",
}
```

**Json parameters**:

- Name – Cron job name.
- Schedule - Schedule rule of cron job.
- ContainerName - Cron job's container name.
- OwnerEmail - Notification email.
- Config
    - Labels – A list of labels in format key=value.
    - Image – A string specifying the image name to use for the container.
    - Cmd – The command to run when starting the container.
    - Env – A list of environment variables in the form of ["VAR=value"[,"VAR2=value2"]].
    - Entrypoint - Set the entry point for the container as a string or an array of strings.
    - Image - A string specifying the image name to use for the container.
    - WorkingDir - A string specifying the working directory for commands to run in.
    - ExposedPorts - An object mapping ports to an empty object in the form of:
          `"ExposedPorts": { "<port>/<tcp|udp>: {}" }`
    - StopSignal - Signal to stop a container as a string or unsigned integer. `SIGTERM` by default. 
- HostConfig
    -   Binds – A list of volume bindings for this container. Each volume binding is a string in one of these forms:
           + `container_path` to create a new volume for the container
           + `volume_name:container_path` to bind-mount a volume managed by a volume plugin into the container.
    -   Links - A list of links for the container. Each link entry should be
          in the form of `container_name:alias`.
    -   PortBindings - A map of exposed container ports and the host port they
          should map to. A JSON object in the form
          `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
          Take note that `port` is specified as a string and not an integer value.
    -   PublishAllPorts - Allocates a random host port for all of a container's
          exposed ports. Specified as a boolean value.
    -   RestartPolicy – The behavior to apply when the container exits.  The
        value is an object with a `Name` property of either `"always"` to
        always restart, `"unless-stopped"` to restart always except when
        user has manually stopped the container or `"on-failure"` to restart only when the container
        exit code is non-zero.  If `on-failure` is used, `MaximumRetryCount`
        controls the number of times to retry before giving up.
        The default is not to restart. (optional)
        An ever increasing delay (double the previous delay, starting at 100mS)
        is added before each restart to prevent flooding the server.
    -   NetworkMode - Sets the networking mode for the container. Supported
          values are: `bridge`.


**Query Parameters**:

-   **name** – Assign the specified name to the cron job. Must
    match `[a-z0-9]([-a-z0-9]*[a-z0-9])?`.

**Status Codes**:

* 201 – no error
* 400 – bad parameter
* 409 – name conflicts with an existing object
* 500 - server error
