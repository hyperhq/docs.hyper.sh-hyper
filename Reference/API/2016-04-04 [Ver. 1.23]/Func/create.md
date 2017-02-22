# Create a function

`POST /funcs/create`

**Example request**:

```
POST /funcs/create HTTP/1.1
Content-Type: application/json

{
  "Name": "helloworld",
  "Size": "s4",
  "Image": "my-hello-world",
  "Command": ["echo", "Hello World"],
  "Header": ["Content-Type=text/plain"],
  "MaxLimit": 50
}
```

**Example response**:

```
HTTP/1.1 201 Created
Content-Type: application/json

{
  "Name": "helloworld",
  "Size": "s4",
  "Image": "my-hello-world",
  "Command": ["echo", "Hello World"],
  "Env": [],
  "Header": ["Content-Type=text/plain"],
  "MaxLimit": 50,
  "UUID": "e5304888-f112-11e6-bc64-92361f002671",
  "Created": "2017-02-10T04:05:26.704Z"
}
```

**Json parameters**:

* Name - the function name.
* Size - the size of containers to run the function (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3).
* Image - a string specifying the image name to use for the container.
* Command - The command to run when starting the container.
* Env - A list of environment variables in the form of ["VAR=value"[,"VAR2=value2"]].
* Header - The http response headers of the endpoint of function status query.
* UUID - The uuid of function.
* Created - The created timestamp of function.
* MaxLimit - The maximum number of function call which waiting for completed, default (-1) is unlimit. 

**Status Codes**:

* 201 - no error
* 400 - bad parameter
* 409 - name conflicts with an existing object
* 500 - server error
