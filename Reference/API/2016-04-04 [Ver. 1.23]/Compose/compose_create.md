# Compose create

`POST /compose/create`

Create a compose project

**Example request**:

```
POST /compose/create?project=blog HTTP/1.1
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

{"status":"Project [blog]: Creating project "}
{"status":"[0/2] [db]: Creating "}
{"status":"[0/2] [db]: Created "}
{"status":"[0/2] [web]: Creating "}
{"status":"[0/2] [web]: Created "}
{"status":"Project [blog]: Project created "}
```

Status Codes:

- **201** - no error
- **500** - Internal Server Error

Parameters:

- **project** - The name of compose project.
- **services** - The services to operate, many services will be splited by '}{'.
- **forcerecreate** - Recreate containers even if their configuration and image haven't changed.
- **norecreate** - If containers already exist, don't recreate them. Incompatible with forcerecreate.

