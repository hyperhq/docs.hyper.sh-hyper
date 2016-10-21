# Remove a service

`DELETE /services/(name)`

Remove a service.

**Example request**:

```
DELETE /services/http HTTP/1.1
```

**Example response**:

```
HTTP/1.1 204 No Content
```

**Query parameters**:

* `keep`: If true, keep containers running while removing the service.

**Status Codes**:

* 204 – no error
* 404 – no such service
* 500 – server error