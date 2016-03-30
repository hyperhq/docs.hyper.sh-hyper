# Create a network

`POST /networks/create`

Create a network

**Example request**:

```
POST /networks/create HTTP/1.1
Content-Type: application/json

{
  "Name":"isolated_nw",
  "Driver":"bridge",
  "IPAM":{
    "Config":[{
      "Subnet":"172.20.0.0/16",
      "IPRange":"172.20.10.0/24",
      "Gateway":"172.20.10.11"
    }],
    "Options": {
        "foo": "bar"
    }
  },
  "Internal":true
}
```

**Example response**:

```
HTTP/1.1 201 Created
Content-Type: application/json

{
  "Id": "22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30",
  "Warning": ""
}
```

Status Codes:

- **201** - no error
- **404** - plugin not found
- **500** - server error

JSON Parameters:

- **Name** - The new network's name. this is a mandatory field
- **Driver** - Name of the network driver plugin to use. Defaults to `bridge` driver
- **IPAM** - Optional custom IP scheme for the network
- **Options** - Network specific options to be used by the drivers
- **CheckDuplicate** - Requests daemon to check for networks with same name
