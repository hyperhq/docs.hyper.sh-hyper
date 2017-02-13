## func log

  Usage: hyper func log [OPTIONS] NAME

  Fetch the realtime execution logs of a func

    --help             Print usage

## Examples

**Fetch realtime log of a func:**

    $ hyper func log helloworld
    2017-02-10T04:05:26.704Z [CALL] Stdin: Hello
    2017-02-10T04:05:27.704Z [PENDING] RequestId: 7f713fff-a65c-4004-b195-72b0c7bce84a
    2017-02-10T04:05:27.704Z [COMPLETED] Stdout: World
