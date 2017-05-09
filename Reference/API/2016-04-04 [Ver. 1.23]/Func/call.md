# Call a function

```
GET/POST/PUT/DELETE https://$region.hyperfunc.io/call/$name/$uuid[/wait]

{payload}
```

Call a function, which returns the call id, no signature authentication requirements.

**Example call**:

```
POST https://us-west-1.hyperfunc.io/call/helloworld/e62c014e-386c-42ea-8d07-41d44e98cc3d HTTP/1.1

Hello
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
  "CallId": "218b7b10-e7f1-4c48-ac3c-66792f8ffc06"
}
```

**URL parameters**:

* $region - Supported region.
* $name - The function name.
* $uuid - The uuid of func.
* /wait - Block until the function call completed.

**Json parameters**:

* CallId - The call id of a function call.

**Status Codes**:

* 200 - no error
* 404 - no such function
* 413 - request entity too large
* 500 - server error
* If use `/wait` parameter: same status codes with [get](./get.md) endpoint.

**Notes**

* The finished/failed/expired function call will be removed once the api with `/wait` parameter is successfully called.
