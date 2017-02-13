## func get

  Usage: hyper func get [OPTIONS] REQUEST_ID

  Query the request status of a func call

    --wait             Block until the request is complete, then print result
    --help             Print usage

## Examples

**Query the request status of a func call:**

    $ hyper func get --wait 7f713fff-a65c-4004-b195-72b0c7bce84a
    World
