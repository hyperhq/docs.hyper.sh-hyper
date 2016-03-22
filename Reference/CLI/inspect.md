## inspect

	Usage:	hyper inspect [OPTIONS] CONTAINER|IMAGE [CONTAINER|IMAGE...]

	Return low-level information on a container or image

	  -f, --format       Format the output using the given go template
	  --help             Print usage
   	  -s, --size         Display total file sizes if the type is container
	  --type             Return JSON for specified type, (e.g image or container)

By default, this will render all results in a JSON array. If the container and image have the same name, this will return container JSON for unspecified type. If a format is specified, the given template will be executed for each result.

Go’s `text/template` package describes all the details of the format.
