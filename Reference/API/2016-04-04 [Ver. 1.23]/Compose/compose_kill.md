# Compose kill

`POST /compose/kill`

Kill a compose project

**Example request**:

```
POST /compose/kill?project=blog HTTP/1.1

```

**Example response**:

```
HTTP/1.1 201 OK

Content-Type: application/json

{"status":"Project [blog]: Killing project "}
{"status":"[0/2] [web]: Killing"}
{"status":"[0/2] [db]: Killing"}
{"status":"[0/2] [db]: Killed"}
{"status":"[0/2] [web]: Killed"}
{"status":"Project [blog]: Project killed "}
```

Status Codes:

- **201** - no error

Parameters:

- **project** - The name of compose project.
- **services** - The services to operate, many services will be splited by '}{'.
- **signal** - The signal to kill container.
