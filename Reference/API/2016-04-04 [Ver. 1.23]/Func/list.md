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
]
```

**Status Codes**:

* 200 – no error
* 500 – server error
