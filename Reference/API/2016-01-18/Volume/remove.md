# Remove a volume

`DELETE /volumes/(name)`

Instruct the driver to remove the volume (`name`).

**Example request**:

    DELETE /volumes/tardis HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Status Codes

-   **204** - no error
-   **404** - no such volume or volume driver
-   **409** - volume is in use and cannot be removed
-   **500** - server error