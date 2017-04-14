## compose create

    Usage:	hyper compose create [OPTIONS] [SERVICE...]

    Creates containers for a service.

      -f, --file=hyper-compose.yml    Specify an alternate compose file
      --force-recreate                Recreate containers even if their configuration
                                      and image haven't changed.
                                      Incompatible with --no-recreate.
      --help                          Print usage
      --no-recreate                   If containers already exist, don't recreate them.
                                      Incompatible with --force-recreate.
      -p, --project-name              Specify an alternate project name


> NOTE: By default, the project name is the current directory name. The project name should be `^[a-zA-Z_][a-zA-Z0-9_]*$`.
