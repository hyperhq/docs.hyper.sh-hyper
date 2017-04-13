# Create a function

`POST /funcs/create`

**Example request**:

```
POST /funcs/create HTTP/1.1
Content-Type: application/json

{
    "Name": "helloworld",
    "Config": {
        "Cmd": [
            "echo",
            "HelloWorld"
        ],
        "Image": "ubuntu"
    }
}
```

**Example response**:

```
HTTP/1.1 201 Created
Content-Type: application/json

{
    "Name": "helloworld",
    "ContainerSize": "s4",
    "Timeout": 300,
    "UUID": "e62c014e-386c-42ea-8d07-41d44e98cc3d",
    "Created": "2017-03-16T07:05:24.473Z",
    "Config": {
        "Env": [],
        "Cmd": [
            "echo",
            "HelloWorld"
        ],
        "Image": "ubuntu",
        "StopSignal": "SIGTERM"
    },
    "HostConfig": {
        "NetworkMode": "bridge"
    },
    "NetworkingConfig": {
        "EndpointsConfig": null
    }
}
```

**Json parameters**:

-   **Name** - the function name.
-   **ContainerSize** - the size of containers to run the function (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3).
-   **Timeout** - The maximum execution duration of function call, default is 300 seconds, maximum is 86400 seconds.
-   **UUID** - The uuid of function.
-   **Created** - The created timestamp of function.

-   **Config**

    -   **Tty** - Boolean value, Attach standard streams to a `tty`, including `stdin` if it is not closed.
    -   **ExposedPorts** - An object mapping ports to an empty object in the form of:
          `"ExposedPorts": { "<port>/<tcp|udp>: {}" }`
    -   **Env** - A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`
    -   **Cmd** - Command to run specified as a string or an array of strings.
    -   **Image** - A string specifying the image name to use for the container.
    -   **Entrypoint** - Set the entry point for the container as a string or an array
          of strings.
    -   **WorkingDir** - A string specifying the working directory for commands to
    -   **Labels** - Adds a map of labels to a container. To specify a map: `{"key":"value"[,"key2":"value2"]}`
    -   `IGNORED` **StopSignal** - Signal to stop a container as a string or unsigned integer. `SIGTERM` by default.

-   **HostConfig**

    -   **Links** - A list of links for the container. Each link entry should be
          in the form of `container_name:alias`.
    -   **PortBindings** - A map of exposed container ports and the host port they
          should map to. A JSON object in the form
          `{ <port>/<protocol>: [{ "HostPort": "<port>" }] }`
          Take note that `port` is specified as a string and not an integer value.
    -   **PublishAllPorts** - Allocates a random host port for all of a container's
          exposed ports. Specified as a boolean value.
    -   **VolumesFrom** - A list of volumes to inherit from another container.
          Specified in the form `<container name>[:<ro|rw>]`
    -   **NetworkMode** - Sets the networking mode for the container. Supported
          values are: `bridge`, `host`, and `container:<name|id>`

**Status Codes**:

* 201 - no error
* 400 - bad parameter
* 409 - name conflicts with an existing object
* 500 - server error
