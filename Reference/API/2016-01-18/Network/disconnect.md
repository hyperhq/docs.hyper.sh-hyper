# Disconnect a container from a network

`POST /networks/(id)/disconnect`

Disconnects a container from a network

**Example request**:

```
POST /networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/disconnect HTTP/1.1
Content-Type: application/json

{
  "Container":"3613f73ba0e4",
  "Force":false
}
```

**Example response**:

    HTTP/1.1 200 OK

Status Codes:

- **200** - no error
- **404** - network or container not found
- **500** - Internal Server Error

JSON Parameters:

- **Container** - container-id/name to be disconnected from a network
- **Force** - Force the container to disconnect from a network
