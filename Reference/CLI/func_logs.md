## func logs

  Usage: hyper func logs [OPTIONS] NAME

  Retrieve the logs of a function

    --help=false              Print usage
    --callid                  Only retrieve specific logs of CallId
    -f, --follow=false        Follow log output
    --tail="all"              Number of lines to show from the end of the logs

## Examples

**Fetch realtime logs of a function:**

    $ hyper func logs -f --callid 7f713fff-a65c-4004-b195-72b0c7bce84a helloworld
    2017-02-10T04:05:26.704Z [CALL] CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a, ShortStdin: Hello
    2017-02-10T04:05:27.704Z [PENDING] CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a
    2017-02-10T04:05:27.704Z [RUNNING] CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a
    2017-02-10T04:05:27.704Z [COMPLETED] CallId: 7f713fff-a65c-4004-b195-72b0c7bce84a, ShortStdout: World, ShortStderr:

**Notes**

* `ShortStdin, ShortStdout, ShortStderr` is the first 255 bytes of `STDIN, STDOUT, STDERR`.
* Each function includes 50MB of logs space (with rotation).
