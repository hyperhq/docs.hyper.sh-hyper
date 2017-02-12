# Create a func

`POST /funcs/create`

**Example request**:

```
POST /funcs/create HTTP/1.1
Content-Type: application/json

{
  "Name": "thumbnail",
  "Size": "s4",
  "Image": "image-resize",
  "Command": ["--size", "200x150"],
  "Env": ["QUALITY=high"],
  "Headers": ["Content-Type=image/jpeg"],
  "MaxConcurrency": 20,
  "MaxLimit": 50
}
```

**Example response**:

```
HTTP/1.1 201 Created
Content-Type: application/json

{
  "Name": "thumbnail",
  "Size": "s4",
  "Image": "image-resize",
  "Command": ["--size", "200x150"],
  "Env": ["QUALITY=high"],
  "Headers": ["Content-Type=image/jpeg"],
  "MaxConcurrency": 20,
  "MaxLimit": 50,
  "UUID": "e5304888-f112-11e6-bc64-92361f002671",
  "Created": "2017-02-10T04:05:26.704Z"
}
```

**Json parameters**:

* Name – Func name.
* Size – The size of func containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3).
* Image – A string specifying the image name to use for the container.
* Command – The command to run when starting the container.
* Env – A list of environment variables in the form of ["VAR=value"[,"VAR2=value2"]].
* Headers – The http response headers of the endpoint of func status query.
* MaxConcurrency – The maximum number of concurrent container, default (-1) is container quota.
* MaxLimit – The maximum number of func call which waiting for completed, default (-1) is unlimit.
* UUID – The uuid of func.
* Created – The created date of func.

**Status Codes**:

* 201 – no error
* 400 – bad parameter
* 409 – name conflicts with an existing object
* 500 - server error
