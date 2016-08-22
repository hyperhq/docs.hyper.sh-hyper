## port

    Usage: hyper port [OPTIONS] CONTAINER

    List open ports for the CONTAINER

      --help=false    Print usage

You can find out all the ports open by:

    $ hyper ps test
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                                            NAMES    PUBLIC IP
    b650456536c7        busybox:latest      top                 54 minutes ago      Up 54 minutes       0.0.0.0:1234->9876/tcp, 0.0.0.0:4321->7890/tcp   test
    $ hyper port test
    7890/tcp -> 0.0.0.0:4321
    9876/tcp -> 0.0.0.0:1234
