# Call a func

```
GET/POST/PUT/DELETE https://$region.hyperapp.io/$func/$uuid

{payload}
```

Call a func then get a Request ID, no authentication required.

**Example request**:

```
POST https://us-west-1.hyperapp.io/helloworld/e5304888-f112-11e6-bc64-92361f002671 HTTP/1.1

Hello
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
  "RequestId": "7f713fff-a65c-4004-b195-72b0c7bce84a"
}
```

**URL parameters**:

* $region - Supported region.
* $func - The func name.
* $uuid - The uuid of func.

**Json parameters**:

* RequestId - The request id of a func call.

**Status Codes**:

* 200 - no error
* 404 - no such func
* 500 - server error
* 413 - request body is too large
* 503 - reached maximum limit of func call which waiting for completed
