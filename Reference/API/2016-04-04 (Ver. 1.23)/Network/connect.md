# Connect a container to a network

`POST /networks/(id)/connect`

Connects a container to a network

**Example request**:

```
POST /networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30/connect HTTP/1.1
Content-Type: application/json

{
  "Container":"3613f73ba0e4",
  "EndpointConfig": {
    "test_nw": {
        "IPv4Address":"172.24.56.89",
        "IPv6Address":"2001:db8::5689"
    }
  }
}
```

**Example response**:

    HTTP/1.1 200 OK

Status Codes:

- **200** - no error
- **404** - network or container is not found
- **500** - Internal Server Error

JSON Parameters:

- **container** - container-id/name to be connected to the network
