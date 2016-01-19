# Resize

`POST /exec/(id)/resize`

Resizes the `tty` session used by the `exec` command `id`.  The unit is number of characters.
This API is valid only if `tty` was specified as part of creating and starting the `exec` command.

**Example request**:

    POST /exec/e90e34656806/resize?h=40&w=80 HTTP/1.1
    Content-Type: text/plain

**Example response**:

    HTTP/1.1 201 OK
    Content-Type: text/plain

Query Parameters:

-   **h** – height of `tty` session
-   **w** – width

Status Codes:

-   **201** – no error
-   **404** – no such exec instance