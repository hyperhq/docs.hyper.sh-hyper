# Compose down

`POST /compose/down`

Stop and remove a compose project

**Example request**:

```
POST /compose/down?project=blog HTTP/1.1
```

**Example response**:

```
HTTP/1.1 201 OK

Content-Type: application/json

{"status":"Project [blog]: Stopping project "}
{"status":"[0/2] [web]: Stopping "}
{"status":"[0/2] [db]: Stopping "}
{"status":"[0/2] [web]: Stopped "}
{"status":"[0/2] [db]: Stopped "}
{"status":"Project [blog]: Project stopped "}
{"status":"Project [blog]: Deleting project "}
{"status":"[0/2] [web]: Deleting "}
{"status":"[0/2] [db]: Deleting "}
{"status":"[0/2] [web]: Deleted "}
{"status":"[0/2] [db]: Deleted "}
{"status":"Project [blog]: Project deleted "}
```

Status Codes:

- **201** - no error
- **500** - Internal Server Error

Parameters:

- **project** - The name of compose project.
- **services** - The services to operate, many services will be splited by '}{'.
- **rmorphans** - Remove containers for services not defined in the Compose file.
- **rmi** - Remove images, type may be one of: 'all' to remove all images, or 'local' to remove only images that don't have an custom name set by the `image` field.
- **vol** - Remove data volumes.
