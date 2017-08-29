# Retrive logs of a function

`GET https://$region.hyperfunc.io/logs/$name/$uuid`

Retrieve the logs of a function.

**The endpoint should be `$region.hyperfunc.io`, and no signature authentication requirements.**

**Example request**:

```
GET https://us-west-1.hyperfunc.io/logs/helloworld/e62c014e-386c-42ea-8d07-41d44e98cc3d?follow=1?callid=218b7b10-e7f1-4c48-ac3c-66792f8ffc06 HTTP/1.1
```

**Example response**:

```
HTTP/1.1 101 UPGRADED
Connection: Upgrade
Upgrade: tcp

{"Time":"2017-03-16T07:05:58.216Z","Event":"CALL","CallId":"218b7b10-e7f1-4c48-ac3c-66792f8ffc06"}
{"Time":"2017-03-16T07:05:58.257Z","Event":"PENDING","CallId":"218b7b10-e7f1-4c48-ac3c-66792f8ffc06"}
{"Time":"2017-03-16T07:06:04.483Z","Event":"RUNNING","CallId":"218b7b10-e7f1-4c48-ac3c-66792f8ffc06"}
{"Time":"2017-03-16T07:06:10.528Z","Event":"FINISHED","CallId":"218b7b10-e7f1-4c48-ac3c-66792f8ffc06","ShortStdout":"HelloWorld\n"}
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
* Event - The event name, can be CALL, PENDING, RUNNING, FINISHED, FAILED.
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
