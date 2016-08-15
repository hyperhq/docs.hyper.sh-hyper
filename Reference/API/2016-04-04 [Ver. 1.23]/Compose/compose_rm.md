# Compose rm

`POST /compose/rm`

Remove a compose project

**Example request**:

```
POST /compose/rm?project=blog HTTP/1.1

```

**Example response**:

```
HTTP/1.1 201 OK

Content-Type: application/json

{"status":"Project [hypercli]: Deleting project "}
{"status":"[0/2] [web]: Deleting "}
{"status":"[0/2] [db]: Deleting "}
{"status":"[0/2] [web]: Deleted "}
{"status":"[0/2] [db]: Deleted "}
{"status":"Project [hypercli]: Project deleted "}
```

Status Codes:

- **201** - no error

Parameters:

- **project** - The name of compose project.
- **services** - The services to operate, many services will be splited by '}{'.
- **rmvol** - Remove attached volumes.
