# Start

`POST /exec/(id)/start`

Starts a previously set up `exec` instance `id`. If `detach` is true, this API
returns after starting the `exec` command. Otherwise, this API sets up an
interactive session with the `exec` command.

**Example request**:

    POST /exec/e90e34656806/start HTTP/1.1
    Content-Type: application/json

    {
     "Detach": false,
     "Tty": false
    }

**Example response**:

    HTTP/1.1 201 OK
    Content-Type: application/json

    {{ STREAM }}

Json Parameters:

-   **Detach** - Detach from the `exec` command.
-   **Tty** - Boolean value to allocate a pseudo-TTY.

Status Codes:

-   **200** – no error
-   **404** – no such exec instance
-   **409** - container is paused

    **Stream details**:
    Similar to the stream behavior of `POST /container/(id)/attach` API