# Update a service

`POST /services/(name)/update`

Update the service.

**Example request**:

Scale replicas to 2:

```
POST /services/http/update HTTP/1.1
Content-Type: application/json

{
  "Replicas": 2
}
```

Attach a floating IP to service:

```
POST /services/http/update HTTP/1.1
Content-Type: application/json

{
  "FIP": "211.98.26.102"
}
```

Detach a floating IP to service:

```
POST /services/http/update HTTP/1.1
Content-Type: application/json

{
  "FIP": ""
}
```

Rolling update container image for a service:

```
POST /services/http/update HTTP/1.1
Content-Type: application/json

{
    "Image": "httpd"
}
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
  "Name": "http",
  "Image": "nginx",
  "WorkingDir": "",
  "ServiceSize": "s4",
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
  "Entrypoint": [],
  "Cmd": [],
  "Env": [],
  "Volumes": {},
  "Labels": {
    "app": "nginx"
  },
  "SecurityGroups": {},
  "IP": "172.16.55.37",
  "Tenant": "b8dc36865f4b480683dabb25598d61c4",
  "FIP": "211.98.26.102",
  "Message": "Scaling complete",
  "Created": "2016-10-08T13:12:15.405Z",
  "Status": "active",
  "Containers": [
    "06d24916033ff1444083ffa582936b11453aa2276e0289657dfef1a9c9310a1c",
    "438074c5fa637e0c4d0b1e543087e67bd1f590f4fa723c4127be4d9a7fbbcf04"
  ]
}
```

**JSON parameters**:

* Image - new image for containers.
* FIP - the fip to attach. Set fip to "" for detaching it.
* Replicas - new replicas of the service.

**Status Codes**:

* 200 – no error
* 500 – server error
