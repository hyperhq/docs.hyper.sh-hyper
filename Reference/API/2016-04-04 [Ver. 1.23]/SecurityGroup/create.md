# Create a security group

`POST /sg/create`

Create a security group

**Example request**:

    POST /sg/create HTTP/1.1
    Content-Type: text/plain

    name: sg-test-1
    description: sg-test-description
    rules:
    - direction: ingress
      port_range_min: 22
      port_range_max: 22
      protocol: tcp
      remote_ip_prefix: 0.0.0.0/0

**Example response**:

    HTTP/1.1 201 Created

Status Codes:

- **201** - no error
- **400** - bad request parameters
- **500** - server error

