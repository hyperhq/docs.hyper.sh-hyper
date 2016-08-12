# Attach the floating IP (FIP) to a container

`POST /fips/attach`

Attach the floating IP to a container

**Example request**:

```
POST /fips/attach?ip=8.8.4.4&container=hehe HTTP/1.1

```

**Example response**:

    HTTP/1.1 204 OK

Status Codes:

- **204** - no error
- **404** - no such FIP/Container
- **500** - Internal Server Error

Parameters:

- **ip** - the FIP to attach
- **container** - the container to be attached
