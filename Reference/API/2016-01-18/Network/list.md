# List networks

`GET /networks`

**Example request**:

    GET /networks?filters={"type":{"custom":true}} HTTP/1.1

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "Name": "bridge",
    "Id": "f2de39df4171b0dc801e8002d1d999b77256983dfc63041c0f34030aa3977566",
    "Scope": "local",
    "Driver": "bridge",
    "IPAM": {
      "Driver": "default",
      "Config": [
        {
          "Subnet": "172.17.0.0/16"
        }
      ]
    },
    "Containers": {
      "39b69226f9d79f5634485fb236a23b2fe4e96a0a94128390a7fbbcc167065867": {
        "EndpointID": "ed2419a97c1d9954d05b46e462e7002ea552f216e9b136b80a7db8d98b442eda",
        "MacAddress": "02:42:ac:11:00:02",
        "IPv4Address": "172.17.0.2/16",
        "IPv6Address": ""
      }
    },
    "Options": {
      "com.docker.network.bridge.default_bridge": "true",
      "com.docker.network.bridge.enable_icc": "true",
      "com.docker.network.bridge.enable_ip_masquerade": "true",
      "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
      "com.docker.network.bridge.name": "docker0",
      "com.docker.network.driver.mtu": "1500"
    }
  },
  {
    "Name": "none",
    "Id": "e086a3893b05ab69242d3c44e49483a3bbbd3a26b46baa8f61ab797c1088d794",
    "Scope": "local",
    "Driver": "null",
    "IPAM": {
      "Driver": "default",
      "Config": []
    },
    "Containers": {},
    "Options": {}
  },
  {
    "Name": "host",
    "Id": "13e871235c677f196c4e1ecebb9dc733b9b2d2ab589e30c539efeda84a24215e",
    "Scope": "local",
    "Driver": "host",
    "IPAM": {
      "Driver": "default",
      "Config": []
    },
    "Containers": {},
    "Options": {}
  }
]
```

Query Parameters:

- **filters** - JSON encoded network list filter. The filter value is one of: 
  -   `name=<network-name>` Matches all or part of a network name.
  -   `id=<network-id>` Matches all or part of a network id.
  -   `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword returns all user-defined networks.

Status Codes:

-   **200** - no error
-   **500** - server error