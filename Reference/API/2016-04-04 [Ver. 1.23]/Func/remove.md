# Remove a function

`DELETE /funcs/$name`

Remove a function.

**Example request**:

```
DELETE /funcs/helloworld HTTP/1.1
```

**Example response**:

```
HTTP/1.1 204 No Content
```

**URL parameters**:

* $name - The function name.

**Status Codes**:

* 204 - no error
* 404 - no such function
* 500 - server error
