# Create a new image from a container's changes

`POST /commit`

Create a new image from a container's changes

**Example request**:

    POST /commit?container=44c004db4b17&comment=message&repo=myrepo HTTP/1.1
    Content-Type: application/json

    {
         "Hostname": "",
         "Domainname": "",
         "User": "",
         "AttachStdin": false,
         "AttachStdout": true,
         "AttachStderr": true,
         "Tty": false,
         "OpenStdin": false,
         "StdinOnce": false,
         "Env": null,
         "Cmd": [
                 "date"
         ],
         "Mounts": [
           {
             "Source": "/data",
             "Destination": "/data",
             "Mode": "ro,Z",
             "RW": false
           }
         ],
         "Labels": {
                 "key1": "value1",
                 "key2": "value2"
          },
         "WorkingDir": "",
         "NetworkDisabled": false,
         "ExposedPorts": {
                 "22/tcp": {}
         }
    }

**Example response**:

    HTTP/1.1 201 Created
    Content-Type: application/json

    {"Id": "596069db4bf5"}

Json Parameters:

-  **config** - the container's configuration

Query Parameters:

-   **container** – source container
-   **repo** – repository
-   **tag** – tag
-   **comment** – commit message
-   **author** – author (e.g., "John Hannibal Smith
    <[hannibal@a-team.com](mailto:hannibal%40a-team.com)>")
-   **pause** – 1/True/true or 0/False/false, whether to pause the container before committing
-   **changes** – Dockerfile instructions to apply while committing

Status Codes:

-   **201** – no error
-   **404** – no such container
-   **500** – server error
