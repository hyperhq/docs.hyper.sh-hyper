# Deassociate the floating IP (FIP) from a container

`POST /fips/disassociate`

Deassociate the floating IP from a container

**Example request**:

```
POST /fips/disassociate?container=hehe HTTP/1.1

```

**Example response**:

    HTTP/1.1 204 OK

Status Codes:

- **204** - no error
- **404** - no such Container
- **500** - Internal Server Error

Parameters:

- **container** - the container to be associated
