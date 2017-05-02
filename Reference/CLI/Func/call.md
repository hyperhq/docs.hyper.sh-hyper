## func call

  Usage: hyper func call [OPTIONS] NAME

  Call a function

    --help             Print usage
    --wait             Block until the call is completed

### Examples

**Call a function and pass a payload:**

    $ echo "Hello" | hyper func call helloworld
    CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06

**Notes**

* The finished/failed/expired function call will be removed once the command with `--wait` parameter is successfully called.
