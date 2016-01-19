# Exec Create

`POST /containers/(id)/exec`

Sets up an exec instance in a running container `id`

**Example request**:

    POST /containers/e90e34656806/exec HTTP/1.1
    Content-Type: application/json

      {
       "AttachStdin": false,
       "AttachStdout": true,
       "AttachStderr": true,
       "DetachKeys": "ctrl-p,ctrl-q",
       "Tty": false,
       "Cmd": [
                     "date"
             ]
      }

**Example response**:

    HTTP/1.1 201 OK
    Content-Type: application/json

    {
         "Id": "f90e34656806",
         "Warnings":[]
    }

Json Parameters:

-   **AttachStdin** - Boolean value, attaches to `stdin` of the `exec` command.
-   **AttachStdout** - Boolean value, attaches to `stdout` of the `exec` command.
-   **AttachStderr** - Boolean value, attaches to `stderr` of the `exec` command.
-   **DetachKeys** – Override the key sequence for detaching a
        container. Format is a single character `[a-Z]` or `ctrl-<value>`
        where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,` or `_`.
-   **Tty** - Boolean value to allocate a pseudo-TTY.
-   **Cmd** - Command to run specified as a string or an array of strings.


Status Codes:

-   **201** – no error
-   **404** – no such container
-   **409** - container is paused
-   **500** - server error