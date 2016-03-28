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
         "Id": "c22d5d52534b2d9fa8a1d07bb06c1cce595b5b083f31f1213d2de129a7e0dc27",
         "Warnings":[]
    }

Json Parameters:

-   **AttachStdin** - Boolean value, attaches to `stdin` of the `exec` command.
-   **AttachStdout** - Boolean value, attaches to `stdout` of the `exec` command.
-   **AttachStderr** - Boolean value, attaches to `stderr` of the `exec` command.
-   **DetachKeys** – Override the key sequence for detaching a container.
-   **Tty** - Boolean value to allocate a pseudo-TTY.
-   **Cmd** - Command to run specified as a string or an array of strings.


Status Codes:

-   **201** – no error
-   **404** – no such container
-   **409** - container is paused
-   **500** - server error
