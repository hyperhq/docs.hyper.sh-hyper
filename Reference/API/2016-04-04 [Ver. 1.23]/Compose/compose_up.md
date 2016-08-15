# Compose up

`POST /compose/up`

Create and start a compose project

**Example request**:

```
POST /compose/up?project=blog HTTP/1.1
Content-Type: application/json

{
    "NetworkConfigs": {},
    "ServiceConfigs": {
        "M": {
            "db": {
                "environment": [
                    "MYSQL_ROOT_PASSWORD=my-secret-pw"
                ],
                "external_links": null,
                "image": "mysql:latest"
            },
            "web": {
                "depends_on": [
                    "db"
                ],
                "external_links": null,
                "image": "wordpress:latest",
                "links": [
                    "db:mysql"
                ]
            }
        }
    },
    "VolumeConfigs": {}
}
```

**Example response**:

```
HTTP/1.1 201 OK

Content-Type: application/json

{"status":"Project [blog]: Starting project "}
{"status":"[0/2] [db]: Starting "}
{"status":"[1/2] [db]: Started "}
{"status":"[1/2] [web]: Starting "}
{"status":"[2/2] [web]: Started "}
{"status":"Project [blog]: Project started "}
```

Status Codes:

- **201** - no error
- **500** - Internal Server Error

Parameters:

- **project** - The name of compose project.
- **services** - The services to operate, many services will be splited by '}{'.
- **forcerecreate** - Recreate containers even if their configuration and image haven't changed.
- **norecreate** - If containers already exist, don't recreate them. Incompatible with forcerecreate.

