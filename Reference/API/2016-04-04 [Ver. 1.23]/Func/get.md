# Query status of a func call

`GET https://$region.hyperapp.io/$func/$uuid/$request_id[/wait]`

Query status of a func call, no authentication required.

**Example request**:

```
GET https://us-west-1.hyperapp.io/helloworld/e5304888-f112-11e6-bc64-92361f002671/7f713fff-a65c-4004-b195-72b0c7bce84a HTTP/1.1
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: text/plain

World
```

**URL parameters**:

* $region - Supported region.
* $func - The func name.
* $uuid - The uuid of func.
* $request_id - The request id of a func call.
* /wait - Block until the func call completed.

**Status Codes**:

* 200 - func call is completed successfully
* 201 - func call is being executed
* 202 - func call is waiting for execution
* 404 - func call not exists
* 509 - response body of func call is too large
* 500 - func call execution error:

        - server error
        - image not exists
