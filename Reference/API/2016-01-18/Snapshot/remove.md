# Remove a snapshot

`DELETE /snapshots/(name)`

Instruct the driver to remove the snapshot (`name`).

**Example request**:

    DELETE /snapshots/snapshot-tardis HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Status Codes

-   **204** - no error
-   **404** - no such snapshot
-   **409** - snapshot is in use and cannot be removed
-   **500** - server error
