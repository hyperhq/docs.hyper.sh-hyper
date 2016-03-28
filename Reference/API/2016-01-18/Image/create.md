# Create an image

`POST /images/create`

Create an image either by pulling it from the registry or by importing it

**Example request**:

    POST /images/create?fromImage=ubuntu HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {"status": "Pulling..."}
    {"status": "Pulling", "progress": "1 B/ 100 B", "progressDetail": {"current": 1, "total": 100}}
    {"error": "Invalid..."}
    ...

When using this endpoint to pull an image from the registry, the
`X-Registry-Auth` header can be used to include
a base64-encoded AuthConfig object.

Query Parameters:

-   **fromImage** – Name of the image to pull. The name may include a tag or digest. This parameter may only be used when pulling an image.  The pull is cancelled if the HTTP connection is closed.
-   **tag** – Tag or digest.

Request Headers:

-   **X-Registry-Auth** – base64-encoded AuthConfig object, containing either login information, or a token
    - Credential based login:

        ```
    {
            "username": "jdoe",
            "password": "secret",
            "email": "jdoe@acme.com",
    }
        ```

    - Token based login:

        ```
    {
            "registrytoken": "9cbaf023786cd7..."
    }
        ```

Status Codes:

-   **200** – no error
-   **500** – server error
