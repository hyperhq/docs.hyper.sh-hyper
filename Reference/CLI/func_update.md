## func update

  Usage:	hyper func update [OPTIONS] NAME

  Update a func

    --size=s4                The size of func containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
    -e, --env=[]             Set environment variables
    --header=[]              The http response header of the endpoint of func status query
    --max_limit=-1           The maximum number of func call which waiting for completed, default (-1) is unlimit
    --refresh                Whether to regenerate the uuid of func

### Examples

**Update a func:**

    $ hyper func update --size s3 --refresh helloworld
    https://us-west-1.hyperapp.io/helloworld/ba06ca01-8366-4331-8c6b-f81b096f6f66
