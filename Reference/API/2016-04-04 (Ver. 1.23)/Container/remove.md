# Remove a container

`DELETE /containers/(id)`

Remove the container `id` from the filesystem

**Example request**:

    DELETE /containers/16253994b7c4?v=1 HTTP/1.1

**Example response**:

    HTTP/1.1 200 
    Content-Type: application/json
    {
        [] // warnings
    }

Query Parameters:

-   **v** – 1/True/true or 0/False/false, Remove the volumes associated to the container.  Default `false`.
-   **force** - 1/True/true or 0/False/false, Kill then remove the container.  Default `false`.

Status Codes:

-   **204** – no error
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error
