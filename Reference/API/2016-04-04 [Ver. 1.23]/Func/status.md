# Retrive status of a function

`GET https://$region.hyperfunc.io/status/$name/$uuid`

Retrieve the status of a function.

**Example request**:

```
GET https://$region.hyperfunc.io/status/helloworld/e5304888-f112-11e6-bc64-92361f002671 HTTP/1.1
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
  Total: 20,
  Pending: 3,
  Running: 10,
  Finished: 4,
  Failed: 0,
  List: [
    {
      CallId: '7f713fff-a65c-4004-b195-72b0c7bce84a',
      Created: '2017-03-10T05:16:02.207Z',
      Status: 'PENDING',
      Message: null
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
