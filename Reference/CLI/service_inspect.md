## service inspect

    Usage:	hyper service inspect [OPTIONS] service [service...]
    
    Display detailed information on the given service
    
    -f, --format       Format the output using the given go template
    --help             Print usage

By default, this will render all results in a JSON array. Go’s `text/template` package describes all the details of the format.

## Examples

**Inspect a service:**

    $ hyper service inspect http
    [
        {
            "Name": "http",
            "Image": "nginx",
            "WorkingDir": "",
            "ContainerSize": "s4",
            "SSLCert": "",
            "NetMode": "bridge",
            "StopSignal": "SIGTERM",
            "ServicePort": 80,
            "ContainerPort": 80,
            "Replicas": 3,
            "HealthCheckInterval": 3,
            "HealthCheckFall": 3,
            "HealthCheckRise": 2,
            "Algorithm": "roundrobin",
            "Protocol": "tcp",
            "Stdin": false,
            "Tty": false,
            "SessionAffinity": false,
            "Entrypoint": [],
            "Cmd": [],
            "Env": [],
            "Volumes": {},
            "Labels": {
                "app": "nginx"
            },
            "SecurityGroups": {},
            "IP": "172.16.55.36",
            "FIP": "",
            "Message": "Scaling complete",
            "Status": "active",
            "Containers": [
                "33cd52f7af63391c9b9eb578130bd46f65f3e2c00ccbe80b9ee882cf40c6043b",
                "54e3d0724f1d2b4429b08e3192c9ba13c93bd8d9077b391e6129e976eb713b7e",
                "a35a66d91e0c0740e36f9f2e43db406fefe964f5a483a8137d9c08472860a53e"
            ]
        }
    ]

**Get an service's internal IP address:**

For the most part, you can pick out any field from the JSON in a fairly
straightforward manner.

    $ hyper service inspect --format='{{json .IP}}' http
    "172.16.55.36"

**Get an service's floating IP address:**

    $ hyper service inspect --format='{{json .FIP}}' http
    "172.16.55.36"

**Get a list of backend containers:**

    $ hyper service inspect --format='{{json .Containers}}' http
    ["33cd52f7af63391c9b9eb578130bd46f65f3e2c00ccbe80b9ee882cf40c6043b","54e3d0724f1d2b4429b08e3192c9ba13c93bd8d9077b391e6129e976eb713b7e","a35a66d91e0c0740e36f9f2e43db406fefe964f5a483a8137d9c08472860a53e"]
