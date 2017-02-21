# Remove a function

`DELETE /func/(name)`

Remove a function.

**Example request**:

```
DELETE /funcs/helloworld HTTP/1.1
```

**Example response**:

```
HTTP/1.1 204 No Content
```

**Status Codes**:

* 204 - no error
* 404 - no such func
* 500 - server error
