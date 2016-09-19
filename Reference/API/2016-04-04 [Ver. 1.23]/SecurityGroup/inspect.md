# Inspect a security group

`GET /sg/name`

Inspect security group

**Example request**:

    GET /sg/sg-test-1 HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

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
        "remote_ip_prefix": "0.0.0.0/0"
       }
      ]
     }

Path Parameters:

- **name** - the security group name

Status Codes:

-   **200** - no error
-   **404** - no such security group
-   **500** - server error
