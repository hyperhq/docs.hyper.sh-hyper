# Restart a container

`POST /containers/(id)/restart`

Restart the container `id`

**Example request**:

    POST /containers/e90e34656806/restart?t=5 HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Query Parameters:

-   **t** – number of seconds to wait before killing the container

Status Codes:

-   **204** – no error
-   **404** – no such container
-   **500** – server error