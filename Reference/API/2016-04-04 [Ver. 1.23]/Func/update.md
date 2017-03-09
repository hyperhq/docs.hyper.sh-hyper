# Update a function

`PUT /funcs/$name`

Update a function.

**Example request**:

```
PUT /funcs/helloworld HTTP/1.1
Content-Type: application/json

{
  "Size": "s3",
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
  "Command": ["echo", "Hello World"],
  "Env": [],
  "UUID": "ba06ca01-8366-4331-8c6b-f81b096f6f66",
  "Created": "2017-02-10T04:05:26.704Z",
  "Timeout": 300
}
```

**URL parameters**:

* $name - The function name.

**JSON parameters**:

* Size - the size of containers to run the function (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3).
* Image - a string specifying the image name to use for the container.
* Command - The command to run when starting the container.
* Env - A list of environment variables in the form of ["VAR=value"[,"VAR2=value2"]].
* Timeout - The maximum execution duration of function call, default is 300 seconds, maximum is 86400 seconds.

**Status Codes**:

* 204 - no content
* 400 - bad request parameters
* 404 - no such function
* 500 - server error