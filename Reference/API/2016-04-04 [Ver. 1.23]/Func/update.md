# Update a function

`PUT /funcs/$name`

Update a function.

**Example request**:

```
PUT /funcs/helloworld HTTP/1.1
Content-Type: application/json

{
  "ContainerSize": "s3",
  "Refresh": true
}
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
    "Name": "helloworld",
    "ContainerSize": "s3",
    "Timeout": 300,
    "UUID": "132e90dc-d7cb-45f1-9d66-0cf5653495b5",
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

**URL parameters**:

* $name - The function name.

**JSON parameters**:

-   **ContainerSize** - the size of containers to run the function (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3).
-   **Timeout** - The maximum execution duration of function call, default is 300 seconds, maximum is 86400 seconds.
-   **Refresh** - Whether to regenerate the uuid of function.

-   **Config**

    -   **Env** - A list of environment variables in the form of `["VAR=value"[,"VAR2=value2"]]`

**Status Codes**:

* 204 - no content
* 400 - bad request parameters
* 404 - no such function
* 500 - server error
