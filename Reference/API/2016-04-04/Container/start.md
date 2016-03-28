# Start a container

`POST /containers/(id)/start`

Start the container `id`

**Example request**:

    POST /containers/(id)/start HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Status Codes:

-   **204** – no error
-   **304** – container already started
-   **404** – no such container
-   **500** – server error
