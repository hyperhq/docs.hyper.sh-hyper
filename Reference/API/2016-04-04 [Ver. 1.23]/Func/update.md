# Update a func

`PUT /funcs/(name)`

Update a func.

**Example request**:

```
PUT /funcs/helloworld HTTP/1.1
Content-Type: application/json

{
  "Size": "s3",
  "MaxLimit": 100,
  "Refresh": true
}
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
  "Name": "helloworld",
  "Size": "s3",
  "Image": "my-hello-world",
  "Command": ["echo", "HelloWorld"],
  "Env": [],
  "Header": ["Content-Type=text/plain"],
  "MaxLimit": 100,
  "UUID": "ba06ca01-8366-4331-8c6b-f81b096f6f66",
  "Created": "2017-02-10T04:05:26.704Z"
}
```

**JSON parameters**:

* Size - The size of func containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3).
* Image - A string specifying the image name to use for the container.
* Command - The command to run when starting the container.
* Env - A list of environment variables in the form of ["VAR=value"[,"VAR2=value2"]].
* Headers - The http response headers of the endpoint of func status query.
* MaxLimit - The maximum number of func call which waiting for completed, default (-1) is unlimit.
* Refresh - Whether to regenerate the uuid of func.

**Status Codes**:

* 204 - no content
* 400 - bad request parameters
* 404 - no such func
* 500 - server error
