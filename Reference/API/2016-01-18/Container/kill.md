# Kill a container

`POST /containers/(id)/kill`

Kill the container `id`

**Example request**:

    POST /containers/e90e34656806/kill HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Query Parameters

-   **signal** - Signal to send to the container: integer or string like `SIGINT`.
        When not set, `SIGKILL` is assumed and the call waits for the container to exit.

Status Codes:

-   **204** – no error
-   **404** – no such container
-   **500** – server error