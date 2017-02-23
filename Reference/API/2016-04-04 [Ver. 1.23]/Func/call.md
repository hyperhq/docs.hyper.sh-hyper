# Call a function

```
GET/POST/PUT/DELETE https://$region.hyperfunc.io/call/$name/$uuid

{payload}
```

Call a function, which returns the call id

**Example call**:

```
POST https://us-west-1.hyperfunc.io/helloworld/e5304888-f112-11e6-bc64-92361f002671 HTTP/1.1

Hello
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
  "CallId": "7f713fff-a65c-4004-b195-72b0c7bce84a"
}
```

**URL parameters**:

* $region - Supported region.
* $name - The function name.
* $uuid - The uuid of func.

**Json parameters**:

* CallId - The call id of a function call.

**Status Codes**:

* 200 - no error
* 404 - no such function
* 413 - request entity too large
* 500 - server error
