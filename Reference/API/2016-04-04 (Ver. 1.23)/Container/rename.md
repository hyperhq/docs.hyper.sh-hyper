# Rename a container

`POST /containers/(id)/rename`

Rename the container `id` to a `new_name`

**Example request**:

    POST /containers/e90e34656806/rename?name=new_name HTTP/1.1

**Example response**:

    HTTP/1.1 204 No Content

Query Parameters:

-   **name** – new name for the container

Status Codes:

-   **204** – no error
-   **404** – no such container
-   **409** - conflict name already assigned
-   **500** – server error