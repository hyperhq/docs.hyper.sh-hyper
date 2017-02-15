# Query logs of a func

`GET /funcs/(name)/log`

Query logs of a func, no authentication required.

**Example request**:

```
GET /funcs/helloworld/log HTTP/1.1
```

**Example response**:

```
HTTP/1.1 101 UPGRADED
Connection: Upgrade
Upgrade: tcp

{"Time": "2017-01-06T15:47:31.485331387Z", "Event": "CALL", "ShortStdin": "Hello"}
{"Time": "2017-01-06T15:47:32.485331387Z", "Event": "PENDING", "RequestId": "7f713fff-a65c-4004-b195-72b0c7bce84a"}
{"Time": "2017-01-06T15:47:33.485331387Z", "Event": "RUNNING", "RequestId": "7f713fff-a65c-4004-b195-72b0c7bce84a"}
{"Time": "2017-01-06T15:47:45.485331387Z", "Event": "COMPLETED", "RequestId": "7f713fff-a65c-4004-b195-72b0c7bce84a", "ShortStdout": "World"}
```

**URL parameters**:

* name - The func name.

**Status Codes**:

* 101 - no error
* 404 - no such func
* 500 - server error
