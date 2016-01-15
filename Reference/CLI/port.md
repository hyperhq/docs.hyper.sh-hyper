## port

    Usage: hyper port [OPTIONS] CONTAINER [PRIVATE_PORT[/PROTO]]

    List open ports for the CONTAINER

      --help=false    Print usage

You can find out all the ports open by:

    $ hyper ps test
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                                            NAMES
    b650456536c7        busybox:latest      top                 54 minutes ago      Up 54 minutes       0.0.0.0:1234->9876/tcp, 0.0.0.0:4321->7890/tcp   test
    $ hyper port test
    7890/tcp -> 0.0.0.0:4321
    9876/tcp -> 0.0.0.0:1234
    $ hyper port test 7890/tcp
    0.0.0.0:4321
    $ hyper port test 7890/udp
    2014/06/24 11:53:36 Error: No public port '7890/udp' published for test
    $ hyper port test 7890
    0.0.0.0:4321