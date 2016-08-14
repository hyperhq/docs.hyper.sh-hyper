# Compose stop

`POST /compose/stop`

Stop a compose project

**Example request**:

```
POST /compose/stop?project=blog HTTP/1.1

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
```

Status Codes:

- **201** - no error

Parameters:

- **project** - The name of compose project.
- **services** - The services to operate, many services will be splited by '}{'.
- **seconds** - Specify a shutdown timeout in seconds.
