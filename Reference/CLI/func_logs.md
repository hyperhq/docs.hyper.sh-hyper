## func logs

    Usage:	hyper func logs [OPTIONS] NAME

    Retrieve the logs of a function

        --callid           Only retrieve specific logs of CallId
        -f, --follow       Follow log output
        --help             Print usage
        --tail=all         Number of lines to show from the end of the logs

## Examples

**Fetch logs of a function:**

    $ hyper func logs -f --callid 218b7b10-e7f1-4c48-ac3c-66792f8ffc06 helloworld
    2017-03-16T15:05:58Z [CALL] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06, ShortStdin: 
    2017-03-16T15:05:58Z [PENDING] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
    2017-03-16T15:06:04Z [RUNNING] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
    2017-03-16T15:06:10Z [FINISHED] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06, ShortStdout: HelloWorld
    , ShortStderr: 

**Notes**

* `ShortStdin, ShortStdout, ShortStderr` is the first 255 bytes of `STDIN, STDOUT, STDERR`.
* Each function includes 50MB of logs space (with rotation).
