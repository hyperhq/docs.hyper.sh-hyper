# Tag an image into a repository

`POST /images/(name)/tag`

Tag the image `name` into a repository

**Example request**:

    POST /images/test/tag?repo=myrepo&force=0&tag=v42 HTTP/1.1

**Example response**:

    HTTP/1.1 201 OK

Query Parameters:

-   **repo** – The repository to tag in
-   **force** – 1/True/true or 0/False/false, default false
-   **tag** - The new tag name

Status Codes:

-   **201** – no error
-   **400** – bad parameter
-   **404** – no such image
-   **409** – conflict
-   **500** – server error