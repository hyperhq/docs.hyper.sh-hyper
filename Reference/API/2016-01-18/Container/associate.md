# Associate a floating IP to a (stopped) container

`POST /containers/(id)/associate`

Associate a floating IP to a (stopped) container

**Example request**:

```
POST /containers/e90e34656806/associate HTTP/1.1
Content-Type: application/json

{
  "FIP":"8.8.8.8"
}
```

**Example response**:

    HTTP/1.1 201 OK

Status Codes:

- **201** - no error
- **404** - client request error
- **500** - Internal Server Error

JSON Parameters:

- **FIP** - the floating IP to associate