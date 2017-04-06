# Inspect a function

`GET /funcs/$name`

Inspect a function to get more details information.

**Example request**:

```
GET /funcs/helloworld HTTP/1.1
Content-Type: application/json
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

[
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
]
```

**URL parameters**:

* $name - The function name.

**Status Codes**:

* 200 - no error
* 404 - no such function
* 500 - server error
