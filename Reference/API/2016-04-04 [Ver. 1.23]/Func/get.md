# Get the return of a function call

`GET https://$region.hyperfunc.io/output/$name/$uuid/$call_id[/wait]`

Get the return of a function call.

**Example request**:

```
GET https://us-west-1.hyperfunc.io/output/helloworld/e62c014e-386c-42ea-8d07-41d44e98cc3d/218b7b10-e7f1-4c48-ac3c-66792f8ffc06 HTTP/1.1
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: text/plain

HelloWorld
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
* 404 - function call not exists
* 410 - the return of function call already expired
* 509 - response body of function call is too large
* 504 - function call execution timeout
* 500 - function call execution error:
        - server error
        - no such image: $image

**Notes**

* The finished/failed/expired function call will be removed once the api is successfully called.
