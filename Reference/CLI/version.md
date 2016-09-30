## version

    Usage: hyper version [OPTIONS]

    Show the Hyper.sh CLI version information.

      -f, --format=""    Format the output using the given go template
      --help=false       Print usage

By default, this will render all version information in an easy to read layout. If a format is specified, the given template will be executed instead.

Go's [text/template](http://golang.org/pkg/text/template/) package describes all the details of the format.

### Examples

**Default output:**

    $ hyper version
	Client:
	 Version:      2016-01-12
	 Go version:   go1.4.2
	 Git commit:   f5bae0a
	 Built:        DEC 23 17:56:00 UTC 2015
	 OS/Arch:      linux/amd64

	Cloud:
	 Endpoint:     https://${region}.hyper.sh/
	 API version:  2015-12-16
	 Default Region:   US/New York (us-ny)

**Get API version:**

    $ Hyper.sh version --format '{{.Cloud.API Version}}'
	2015-12-16
