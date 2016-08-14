# Compose start

`POST /compose/start`

Start a compose project

**Example request**:

```
POST /compose/start?project=blog HTTP/1.1

```

**Example response**:

```
HTTP/1.1 201 OK

Content-Type: application/json

{"status":"Project [blog]: Starting project "}
{"status":"[0/2] [db]: Starting "}
{"status":"[0/2] [db]: Started "}
{"status":"[0/2] [web]: Starting "}
{"status":"[0/2] [web]: Started "}
{"status":"Project [blog]: Started project "}
```

Status Codes:

- **201** - no error

Parameters:

- **project** - The name of compose project.
- **services** - The services to operate, many services will be splited by '}{'.
