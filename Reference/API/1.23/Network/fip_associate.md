# Associate the floating IP (FIP) to a container

`POST /fips/associate`

Associate the floating IP to a container

**Example request**:

```
POST /fips/associate?ip=8.8.4.4&container=hehe HTTP/1.1

```

**Example response**:

    HTTP/1.1 204 OK

Status Codes:

- **204** - no error
- **404** - no such FIP/Container
- **500** - Internal Server Error

Parameters:

- **ip** - the FIP to assocate
- **container** - the container to be assocated
