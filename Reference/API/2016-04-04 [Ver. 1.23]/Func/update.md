# Update a func

`PUT /funcs/(name)`

Update a func.

**Example request**:

```
PUT /funcs/thumbnail HTTP/1.1
Content-Type: application/json

{
  "Size": "s4",
  "Image": "image-resize",
  "Command": ["--size", "200x150"],
  "Env": ["QUALITY=high"],
  "Headers": ["Content-Type=image/jpeg"],
  "MaxConcurrency": 20,
  "MaxLimit": 50,
  "Refresh": true
}
```

**Example response**:

```
HTTP/1.1 200 OK
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
  "UUID": "82a1cae2-b08a-4e74-b890-4cf9de4c7ba8",
  "Created": "2017-02-10T04:05:26.704Z"
}
```

**JSON parameters**:

* Size – The size of func containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3).
* Image – A string specifying the image name to use for the container.
* Command – The command to run when starting the container.
* Env – A list of environment variables in the form of ["VAR=value"[,"VAR2=value2"]].
* Headers – The http response headers of the endpoint of func status query.
* MaxConcurrency – The maximum number of concurrent container, default (-1) is container quota.
* MaxLimit – The maximum number of func call which waiting for completed, default (-1) is unlimit.
* Refresh - Whether to regenerate the uuid of func.

**Status Codes**:

* 204 - no content
* 400 - bad request parameters
* 404 - no such func
* 500 - server error
