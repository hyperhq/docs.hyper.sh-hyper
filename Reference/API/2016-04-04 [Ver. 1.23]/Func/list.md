# List funcs

`GET /funcs`

List all funcs.

**Example request**:

```
GET /funcs HTTP/1.1
Content-Type: application/json
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "Name": "helloworld",
    "Size": "s4",
    "Image": "my-hello-world",
    "Command": ["echo", "World"],
    "Env": [],
    "Header": ["Content-Type=text/plain"],
    "MaxConcurrency": 20,
    "MaxLimit": 50,
    "UUID": "e5304888-f112-11e6-bc64-92361f002671",
    "Created": "2017-02-10T04:05:26.704Z"
  }
]
```

**Status Codes**:

* 200 – no error
* 500 – server error
