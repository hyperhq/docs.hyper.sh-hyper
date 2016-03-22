### Attach to a container (websocket)

`GET /containers/(id or name)/attach/ws`

Attach to the container `id` via websocket

Implements websocket protocol handshake according to [RFC 6455](http://tools.ietf.org/html/rfc6455)

**Example request**

    GET /containers/e90e34656806/attach/ws?logs=0&stream=1&stdin=1&stdout=1&stderr=1 HTTP/1.1

**Example response**

    {{ STREAM }}

Query Parameters:

-   **detachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
-   **logs** – 1/True/true or 0/False/false, return logs. Default `false`.
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default `false`.
-   **stdin** – 1/True/true or 0/False/false, if `stream=true`, attach
        to `stdin`. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, if `logs=true`, return
        `stdout` log, if `stream=true`, attach to `stdout`. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, if `logs=true`, return
        `stderr` log, if `stream=true`, attach to `stderr`. Default `false`.

Status Codes:

-   **200** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error

### Wait a container

`POST /containers/(id or name)/wait`

Block until container `id` stops, then returns the exit code

**Example request**:

    POST /containers/16253994b7c4/wait HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {"StatusCode": 0}

Status Codes:

-   **200** – no error
-   **404** – no such container
-   **500** – server error