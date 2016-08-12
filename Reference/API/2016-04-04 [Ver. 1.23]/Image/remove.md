# Remove an image

`DELETE /images/(name)`

Remove the image `name` from the filesystem

**Example request**:

    DELETE /images/test HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-type: application/json

    [
     {"Untagged": "3e2f21a89f"},
     {"Deleted": "3e2f21a89f"},
     {"Deleted": "53b4f83ac9"}
    ]

Query Parameters:

-   **force** – 1/True/true or 0/False/false, default false

Status Codes:

-   **200** – no error
-   **404** – no such image
-   **409** – conflict
-   **500** – server error
