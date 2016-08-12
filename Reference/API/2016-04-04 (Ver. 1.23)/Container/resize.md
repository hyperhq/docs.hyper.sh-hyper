# Resize a container TTY

`POST /containers/(id)/resize`

Resize the TTY for container with `id`. The unit is number of characters. You must restart the container for the resize to take effect.

**Example request**:

      POST /containers/4fa6e0f0c678/resize?h=40&w=80 HTTP/1.1

**Example response**:

      HTTP/1.1 200 OK
      Content-Length: 0
      Content-Type: text/plain; charset=utf-8

Query Parameters:

-   **h** – height of `tty` session
-   **w** – width

Status Codes:

-   **200** – no error
-   **404** – No such container
-   **500** – Cannot resize container
