# Pause a container

`POST /containers/(id)/pause`

Pause the container `id`

**Example request**:

    POST /containers/e90e34656806/pause HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Status Codes:

-   **204** – no error
-   **404** – no such container
-   **500** – server error