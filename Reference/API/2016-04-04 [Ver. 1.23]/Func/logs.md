# Retrive logs of a function

`GET https://$region.hyperfunc.io/logs/$name/$uuid`

Retrieve the logs of a function.

**Example request**:

```
GET https://$region.hyperfunc.io/logs/helloworld/e5304888-f112-11e6-bc64-92361f002671?follow=1?callid=7f713fff-a65c-4004-b195-72b0c7bce84a HTTP/1.1
```

**Example response**:

```
HTTP/1.1 101 UPGRADED
Connection: Upgrade
Upgrade: tcp

{"Time": "2017-01-06T15:47:31.485331387Z", "Event": "CALL", "CallId": "7f713fff-a65c-4004-b195-72b0c7bce84a", "ShortStdin": "Hello"}
{"Time": "2017-01-06T15:47:32.485331387Z", "Event": "PENDING", "CallId": "7f713fff-a65c-4004-b195-72b0c7bce84a"}
{"Time": "2017-01-06T15:47:33.485331387Z", "Event": "RUNNING", "CallId": "7f713fff-a65c-4004-b195-72b0c7bce84a"}
{"Time": "2017-01-06T15:47:45.485331387Z", "Event": "COMPLETED", "CallId": "7f713fff-a65c-4004-b195-72b0c7bce84a", "ShortStdout": "World", "ShortStderr": ""}
```

**URL parameters**:

* $region - Supported region.
* $name - The function name.
* $uuid - The uuid of function.

**Query Parameters:**

- **callid** - Filter logs of specific CallId. Default `all`.
- **follow** - 1/True/true or 0/False/false, return stream. Default `false`.
- **tail** - Output specified number of lines at the end of logs: `all` or `<number>`. Default all.

**Json Response**:

* Time - The time of the event.
* Event - The event name, can be CALL, PENDING, RUNNING, COMPLETED, ERROR.
* CallId - The call id of a function call.
* ShortStdin - The first few bytes of STDIN.
* ShortStdout - The first few bytes of STDOUT.
* ShortStderr - The first few bytes of STDERR.
* Message - The error message.

**Status Codes**:

* 101 - no error, hints proxy about hijacking
* 200 - no error, no upgrade header found
* 404 - no such function
* 500 - server error