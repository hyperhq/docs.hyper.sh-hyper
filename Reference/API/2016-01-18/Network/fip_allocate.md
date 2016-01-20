# Allocate floating IP (FIP)

`POST /fips/allocate`

Allocate free floating IP

**Example request**:

```
POST /fips/allocate HTTP/1.1
Content-Type: application/json

{
  "Count":"5"
}
```

**Example response**:

    HTTP/1.1 201 OK

Status Codes:

- **201** - no error
- **404** - client request error
- **500** - Internal Server Error

JSON Parameters:

- **Count** - the number of free FIPs to allocate