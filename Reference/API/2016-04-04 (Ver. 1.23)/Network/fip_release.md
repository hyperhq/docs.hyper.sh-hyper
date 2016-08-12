# Release floating IP (FIP)

`POST /fips/release`

Release floating IP

**Example request**:

```
POST /fips/release?ip=8.8.8.8 HTTP/1.1

```

**Example response**:

    HTTP/1.1 204 OK

Status Codes:

- **204** - no error
- **404** - no such FIP
- **500** - Internal Server Error

Parameters:

- **ip** - the FIP to release
