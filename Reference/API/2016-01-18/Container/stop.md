# Stop a container

`POST /containers/(id)/stop`

Stop the container `id`

**Example request**:

    POST /containers/e90e34656806/stop?t=5 HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Query Parameters:

-   **t** – number of seconds to wait before killing the container

Status Codes:

-   **204** – no error
-   **304** – container already stopped
-   **404** – no such container
-   **500** – server error