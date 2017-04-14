## volume inspect

    Usage:  hyper volume inspect [OPTIONS] VOLUME [VOLUME...]

    Return low-level information on a volume

        -f, --format       Format the output using the given go template
        --help             Print usage

By default, this will render all results in a JSON array. If a format is specified, the given template will be executed for each result.

Go’s `text/template` package describes all the details of the format.

## Examples

    $ hyper volume inspect data
    [
        {
            "Name": "data",
            "Driver": "hyper",
            "Mountpoint": "",
            "Labels": {
                "container": "",
                "size": "10",
                "snapshot": ""
            },
            "CreatedAt": "2017-03-28T13:37:43.744Z"
        }
    ]
