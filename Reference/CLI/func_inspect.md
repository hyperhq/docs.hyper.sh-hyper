## func inspect

  Usage:	hyper func inspect [OPTIONS] NAME [NAME...]

  Display detailed information on the given func

    -f, --format       Format the output using the given go template
    --help             Print usage

By default, this will render all results in a JSON array. Go’s `text/template` package describes all the details of the format.

## Examples

**Inspect a func:**

    $ hyper func inspect http
    [
        {
            "Name": "thumbnail",
            "Size": "s4",
            "Image": "image-resize",
            "Command": ["--size", "200x150"],
            "Env": ["QUALITY=high"],
            "Headers": ["Content-Type=image/jpeg"],
            "MaxConcurrency": 20,
            "MaxLimit": 50,
            "UUID": "e5304888-f112-11e6-bc64-92361f002671",
            "Created": "2017-02-10T04:05:26.704Z"
        }
    ]
