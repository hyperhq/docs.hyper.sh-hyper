# Remove a security group

`DELETE /sg/name`

Remove a security group

**Example request**:

    DELETE /sg/sg-test-1 HTTP/1.1

**Example response**:

    HTTP/1.1 204 OK

Path Parameters:

- **name** - the security group name

Status Codes:

-   **204** - no content
-   **404** - no such security group
-   **500** - server error
