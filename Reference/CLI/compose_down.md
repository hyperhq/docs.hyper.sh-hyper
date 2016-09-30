## Compose down

	Usage:	hyper compose down [OPTIONS]

	Stop and remove containers, images, and volumes
	created by `up`. Only containers and networks are removed by default.

	  --help                Print usage
	  -p, --project-name    Specify an alternate project name
	  --remove-orphans      Remove containers for services not defined in the Compose file
	  --rmi                 Remove images, type may be one of: 'all' to remove
	                        all images, or 'local' to remove only images that
	                        don't have an custom name set by the `image` field
	  -v, --volumes         Remove data volumes


> NOTE: By default, the project name is the current directory name.

The Hyper.sh compose will not accept compose file, you may operate the project by using `-p` option.
