# Push an image on the registry

`POST /images/(name)/push`

Push the image `name` on the registry

**Example request**:

    POST /images/test/push HTTP/1.1

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {"status": "Pushing..."}
    {"status": "Pushing", "progress": "1/? (n/a)", "progressDetail": {"current": 1}}}
    {"error": "Invalid..."}
    ...

If you wish to push an image on to a private registry, that image must already have a tag
into a repository which references that registry `hostname` and `port`.  This repository name should
then be used in the URL. This duplicates the command line's flow.

The push is cancelled if the HTTP connection is closed.

**Example request**:

    POST /images/registry.acme.com:5000/test/push HTTP/1.1


Query Parameters:

-   **tag** – The tag to associate with the image on the registry. This is optional.

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
-   **404** – no such image
-   **500** – server error
