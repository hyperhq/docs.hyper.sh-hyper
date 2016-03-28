# Remove a network

`DELETE /networks/(id)`

Instruct the driver to remove the network (`id`).

**Example request**:

    DELETE /networks/22be93d5babb089c5aab8dbc369042fad48ff791584ca2da2100db837a1c7c30 HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK

Status Codes

-   **200** - no error
-   **404** - no such network
-   **500** - server error