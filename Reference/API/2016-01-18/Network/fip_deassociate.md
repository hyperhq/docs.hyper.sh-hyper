# Deassociate the floating IP to a (stopped) container

`POST /containers/(id)/deassociate`

Deassociate the floating IP from a (stopped) container

**Example request**:

```
POST /containers/e90e34656806/deassociate HTTP/1.1
Content-Type: application/json
```

**Example response**:

    HTTP/1.1 201 OK

Status Codes:

- **201** - no error
- **404** - client request error
- **500** - Internal Server Error
