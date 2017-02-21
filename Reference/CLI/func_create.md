## func create

  Usage:	hyper func create [OPTIONS] IMAGE [COMMAND] [ARG...]

  Create a new func

    --name                   Func name
    --size=s4                The size of func containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
    -e, --env=[]             Set environment variables
    --header=[]              The http response header of the endpoint of func status query
    --max_limit=-1           The maximum number of func call which waiting for completed, default (-1) is unlimit

Creates a new func based on the image and options.

### Examples

**Create a func:**

    $ hyper func create --name helloworld --size s4 --header "Content-Type=text/plain" --max_limit 50 echo World
    helloworld
