# Create a service

`POST /services/create`

**Example request**:

```
POST /services/create HTTP/1.1
Content-Type: application/json

{
  "Name": "http",
  "Image": "nginx",
  "ContainerPort": 80,
  "Replicas": 2,
  "Protocol": "http",
  "ServicePort": 80,
  "Labels": {
    "app": "nginx"
  }
}
```

**Example response**:

```
HTTP/1.1 201 Created
Content-Type: application/json

{
  "Name": "http",
  "Image": "nginx",
  "WorkingDir": "",
  "ContainerSize": "s4",
  "SSLCert": "",
  "NetMode": "",
  "StopSignal": "",
  "ServicePort": 80,
  "ContainerPort": 80,
  "Replicas": 2,
  "HealthCheckInterval": 5,
  "HealthCheckFall": 3,
  "HealthCheckRise": 2,
  "Algorithm": "roundrobin",
  "Protocol": "http",
  "Stdin": false,
  "Tty": false,
  "SessionAffinity": false,
  "Entrypoint": null,
  "Cmd": null,
  "Env": null,
  "Volumes": null,
  "Labels": {
    "app": "nginx"
  },
  "SecurityGroups": null,
  "IP": "",
  "Tenant": "b8dc36865f4b480683dabb25598d61c4",
  "FIP": "",
  "Message": "Service is created",
  "Created": "2016-10-08T13:12:15.405946064Z",
  "Status": "created",
  "Containers": null
}
```

**Json parameters**:

* Name – Service name
* Labels – A list of labels in format key=value.
* Image – A string specifying the image name to use for the container.
* Entrypoint – The entrypoint to run when starting the container.
* Cmd – The command to run when starting the container.
* Env – A list of environment variables in the form of ["VAR=value"[,"VAR2=value2"]].
* WorkingDir – A string specifying the working directory for commands to run in.
* Volumes - A list of volumes in format `volume_name:container_path:ro`.
* TTY - Indicates whether allocates a pseudo-TTY.
* Stdin - Keep STDIN open even if not attached.
* NetMode - Connect containers to a network, only bridge is supported now.
* StopSignal - Signal to stop a container, SIGTERM by default.
* SecurityGroups - Security group for the container.
* ServicePort - Serving port of the service.
* ContainerPort - Container port of this serivce (default same with service port).
* ContainerSize - The size of service containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3).
* Replicas - Number of containers belonging to this service.
* Protocol - Service protocol (e.g. http, https, tcp, httpsTerm).
* SSLCert - SSL cert for httpsTerm services (Only for httpsTerm).
* HealthCheckInterval - Interval in seconds for health checking the service backends.
* HealthCheckFall - Number of consecutive valid health checks before considering the server as DOWN.
* HealthCheckRise - Number of consecutive valid health checks before considering the server as UP.
* Algorithm - The algorithm of the service (e.g. roundrobin, leastconn, source).
* SessionAffinity - Whether the service uses sticky sessions.

**Status Codes**:

* 201 – no error
* 409 – name conflicts with an existing object
* 500 - server error
