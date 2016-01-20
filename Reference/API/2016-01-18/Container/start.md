# Start a container

`POST /containers/(id)/start`

Start the container `id`

> **Note**:
> For backwards compatibility, this endpoint accepts a `HostConfig` as JSON-encoded request body.
> See [create a container](#create-a-container) for details.

**Example request**:

    POST /containers/(id)/start HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Query Parameters:

-   **detachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.

Status Codes:

-   **204** – no error
-   **304** – container already started
-   **404** – no such container
-   **500** – server error