# List security groups

`GET /sg`

List security group

**Example request**:

    GET /sg HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    [
     {
      "name": "sg-test-1",
      "type": "",
      "description": "sg-test-description",
      "rules": [
       {
        "Direction": "ingress",
        "port_range_min": 22,
        "port_range_max": 22,
        "Protocol": "tcp",
        "remote_ip_prefix": ""
       }
      ]
     }
    ]


Query Parameters:

- **filters** - JSON encoded value of the filters (a `map[string][]string`) to process on the volumes list. There is one available filter: `dangling=true`.

Status Codes:

-   **200** - no error
-   **500** - server error
