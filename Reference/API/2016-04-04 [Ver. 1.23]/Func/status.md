# Retrive status of a function

`GET https://$region.hyperfunc.io/status/$name/$uuid`

Retrieve the status of a function, no signature authentication requirements.

**Example request**:

```
GET https://us-west-1.hyperfunc.io/status/helloworld/e5304888-f112-11e6-bc64-92361f002671?list=1 HTTP/1.1
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
    "Total": 1,
    "Pending": 0,
    "Running": 0,
    "Finished": 1,
    "Failed": 0,
    "List": [
        {
            "CallId": "218b7b10-e7f1-4c48-ac3c-66792f8ffc06",
            "Created": "2017-03-16T07:06:10.528Z",
            "Status": "FINISHED",
            "Message": null
        }
    ]
}
```

**Query Parameters:**

- **list** - 1/True/true or 0/False/false, return `List`. Default `false`.

**Status Codes**:

* 200 - no error
* 404 - no such function
* 500 - server error
