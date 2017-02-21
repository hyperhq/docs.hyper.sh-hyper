## func log

  Usage: hyper func logs [OPTIONS] NAME

  Fetch the realtime logs of a func

    --help             Print usage

## Examples

**Fetch realtime logs of a func:**

    $ hyper func logs helloworld
    2017-02-10T04:05:26.704Z [CALL] ShortStdin: Hello
    2017-02-10T04:05:27.704Z [PENDING] RequestId: 7f713fff-a65c-4004-b195-72b0c7bce84a
    2017-02-10T04:05:27.704Z [RUNNING] RequestId: 7f713fff-a65c-4004-b195-72b0c7bce84a
    2017-02-10T04:05:27.704Z [COMPLETED] RequestId: 7f713fff-a65c-4004-b195-72b0c7bce84a, ShortStdout: World
