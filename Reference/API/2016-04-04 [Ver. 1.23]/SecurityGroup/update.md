# Update a security group

`PUT /sg/name`

Update a security group

**Example request**:

    PUT /sg/sg-test-1 HTTP/1.1
    Content-Type: text/plain

    name: sg-test-1
    description: sg-test-description
    rules:
    - direction: ingress
      port_range_min: 22
      port_range_max: 23
      protocol: tcp
      remote_ip_prefix: 0.0.0.0/0

**Example response**:

    HTTP/1.1 204 No Content

Status Codes:

- **204** - no content
- **400** - bad request parameters
- **404** - no such security group
- **500** - server error

