# Update a container

`PUT /containers/name`

Update a container

**Example request**:

    PUT /containers/name HTTP/1.1
    Content-Type: application/json

    {
      "AddSecurityGroups": {
        "sg-test-1": "yes"
      },
      "RemoveSecurityGroups": {
        "sg-test-2": "yes"
      }
    }

**Example response**:

      HTTP/1.1 204 No Content

Json Parameters:
- AddSecurityGroups:      Added security groups for the container
- RemoveSecurityGroups:   Removed security groups for the container
