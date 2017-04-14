## compose rm

	Usage:	hyper compose rm [OPTIONS] [SERVICE...]

	Remove stopped service containers.

	  --help                Print usage
	  -p, --project-name    Specify an alternate project name
	  -v                    Remove volumes associated with containers


> NOTE: By default, the project name is the current directory name.
If there are no running containers, the compose project will be deleted.
