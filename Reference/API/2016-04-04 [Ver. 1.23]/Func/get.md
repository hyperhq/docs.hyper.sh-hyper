# Get the return of a function call

`GET https://$region.hyperfunc.io/output/$name/$uuid/$call_id[/wait]`

Get the return of a function call.

**Example request**:

```
GET https://us-west-1.hyperfunc.io/helloworld/e5304888-f112-11e6-bc64-92361f002671/7f713fff-a65c-4004-b195-72b0c7bce84a HTTP/1.1
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: text/plain

Hello World
```

**URL parameters**:

* $region - Supported region.
* $name - The function name.
* $uuid - The uuid of function.
* $call_id - The id of a function call.
* /wait - Block until the function call completed.

**Status Codes**:

* 200 - function call is completed successfully
* 201 - function call is being executed
* 202 - function call is waiting for execution
* 204 - the return of function call already expired
* 404 - function call not exists
* 509 - response body of function call is too large
* 504 - function call execution timeout
* 500 - function call execution error:
        - server error
        - image not exists
