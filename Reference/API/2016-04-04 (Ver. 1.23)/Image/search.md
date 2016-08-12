# Search images

`GET /images/search`

Search for an image on [Docker Hub](https://hub.docker.com).

**Example request**:

    GET /images/search?term=sshd HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    [
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "wma55/u1210sshd",
                "star_count": 0
            },
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "jdswinbank/sshd",
                "star_count": 0
            },
            {
                "description": "",
                "is_official": false,
                "is_automated": false,
                "name": "vgauthier/sshd",
                "star_count": 0
            }
    ...
    ]

Query Parameters:

-   **term** – term to search

Status Codes:

-   **200** – no error
-   **500** – server error
