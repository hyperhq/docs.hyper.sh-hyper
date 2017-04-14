## func inspect

  Usage: hyper func inspect [OPTIONS] NAME [NAME...]

  Display detailed information on the given function

    -f, --format       Format the output using the given go template
    --help             Print usage

By default, this will render all results in a JSON array. Go’s `text/template` package describes all the details of the format.

## Examples

**Inspect a function:**

    $ hyper func inspect helloworld
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
