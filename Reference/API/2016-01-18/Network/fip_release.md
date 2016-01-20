# Release floating IP (FIP)

`POST /fips/release`

Release floating IP

**Example request**:

```
POST /fips/release HTTP/1.1
Content-Type: application/json

{
  "FIP":["8.8.8.8", "9.9.9.9"]
}
```

**Example response**:

    HTTP/1.1 201 OK

Status Codes:

- **201** - no error
- **404** - client request error
- **500** - Internal Server Error

JSON Parameters:

- **FIP** - the array of FIPs to release