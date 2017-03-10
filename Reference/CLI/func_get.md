## func get

  Usage: hyper func get [OPTIONS] CALL_ID

Get the return of a function call

    --wait             Block until the call is completed
    --help             Print usage

## Examples

**Get the return of a function call:**

    $ hyper func get --wait 7f713fff-a65c-4004-b195-72b0c7bce84a
    Hello World

**Notes**

* The finished/failed/expired function call will be removed once the command is successfully called.