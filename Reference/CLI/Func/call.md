## func call

  Usage: hyper func call [OPTIONS] NAME

  Call a function

    --help             Print usage
    --sync             Block until the call is completed

### Examples

**Call a function and pass a payload:**

    $ echo "Hello" | hyper func call helloworld
    CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06

**Notes**

* The finished/failed function call will be removed once the command with `--sync` parameter is successfully called.
