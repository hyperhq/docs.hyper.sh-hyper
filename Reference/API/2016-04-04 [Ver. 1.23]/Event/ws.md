# Monitor events

This is a websocket api, it supports to watch `start` and `stop` event of container(s).

The entrypoint of the websocket api is  `wss://us-west-1.hyper.sh:443/events/ws`. In addition, it's same as other apis.

As a reference, here is an [example websocket client](https://github.com/hyperhq/websocket-client/blob/master/go/wsclient.go) (written by golang)


`GET /events/ws`

**Example request**:

    //watch all containers
    GET /events/ws

**Example response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "Action": "start",
      "Actor": {
        "Attributes": {
          "": "",
          "exitCode": "0",
          "image": "xjimmyshcn/busybox",
          "name": "test4",
          "sh_hyper_instancetype": "s4",
          "test1": "",
          "test2": "test2",
          "test3": "test3=test3"
        },
        "ID": "f29698cac3f6f66e84790fb12b3e5e4f3455b89b3ff12150ac4d86b8b90d9179"
      },
      "Type": "container",
      "from": "xjimmyshcn/busybox",
      "id": "f29698cac3f6f66e84790fb12b3e5e4f3455b89b3ff12150ac4d86b8b90d9179",
      "status": "start",
      "time": 1.476375852e+09,
      "timeNano": 1.4763758521916593e+18
    }

**Example request, filter by container**:

    GET /events/ws?filters={"container":{"test":true}} HTTP/1.1

**Example request, filter by image**:

    GET /events/ws?filters={"image":{"ubuntu":true}} HTTP/1.1

**Example request, filter by event**:

    GET /events/ws?filters={"event":{"start":true}} HTTP/1.1

**Example request, filter by label**:

    GET /events/ws?filters={"label":{"sh_hyper_instancetype=s4":true}} HTTP/1.1

**Example request, compound filter**:

    GET /events/ws?filters={"event":{"stop":true},"label":{"sh_hyper_instancetype=s4":true}} HTTP/1.1


Query Parameters:

**filters** – A json encoded value of the filters (a map[string][]string) to process on the event list. Available filters:

 - container=<string>; – container to filter
 - event=<string>; – event to filter, valid value : start|stop
 - image=<string>; – image to filter
 - label=<string>; – container label to filter


Status Codes:

-   **200** – no error
-   **400** - bad request parameter
-   **429** - too many requests
-   **500** – server error
