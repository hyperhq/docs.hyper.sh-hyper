# Allocate floating IP (FIP)

`POST /fips/allocate`

Allocate free floating IP

**Example request**:

```
POST /fips/allocate?count=5 HTTP/1.1
```

**Example response**:

```
HTTP/1.1 201 OK

Content-Type: application/json

{
  [
    "172.16.0.6",
    "172.16.0.7",
    "172.16.0.8",
    "172.16.0.9",
    "172.16.0.10",
  ]
}
```

Status Codes:

- **201** - no error
- **500** - Internal Server Error

Parameters:

- **count** - the number of free FIPs to allocate
