## func inspect

  Usage:	hyper func inspect [OPTIONS] NAME [NAME...]

  Display detailed information on the given function

    -f, --format       Format the output using the given go template
    --help             Print usage

By default, this will render all results in a JSON array. Go’s `text/template` package describes all the details of the format.

## Examples

**Inspect a function:**

    $ hyper func inspect helloworld
    [
        {
            "Name": "helloworld",
            "Size": "s4",
            "Image": "my-hello-world",
            "Command": ["echo", "Hello World"],
            "Env": [],
            "Header": ["Content-Type=text/plain"],
            "UUID": "e5304888-f112-11e6-bc64-92361f002671",
            "Created": "2017-02-10T04:05:26.704Z",
            "Timeout": 300
        }
    ]
