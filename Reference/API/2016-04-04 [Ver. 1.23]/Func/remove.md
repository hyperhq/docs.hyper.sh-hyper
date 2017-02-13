# Remove a func

`DELETE /funcs/(name)`

Remove a func.

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
