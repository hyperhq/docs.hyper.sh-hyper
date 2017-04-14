## func get

  Usage: hyper func get [OPTIONS] CALL_ID

Get the return of a function call

    --wait             Block until the call is completed
    --help             Print usage

## Examples

**Get the return of a function call:**

    $ hyper func get --wait 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
    HelloWorld

**Notes**

* The finished/failed/expired function call will be removed once the command is successfully called.
