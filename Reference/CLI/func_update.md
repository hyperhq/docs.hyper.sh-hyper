## func update

  Usage:	hyper func update [OPTIONS] IMAGE [COMMAND]

  Update a func

    --name                   Func name
    --size=s4                The size of func containers (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
    -e, --env=[]             Set environment variables
    --header=[]              The http response header of the endpoint of func status query
    --max_concurrency=-1     The maximum number of concurrent container, default (-1) is container quota
  	--max_limit=-1           The maximum number of func call which waiting for completed, default (-1) is unlimit
    --image                  The image name to use for the container
    --command                The command to run when starting the container
    --refresh                Whether to regenerate the uuid of func

### Examples

**Update a func:**

    $ hyper func update --name thumbnail --size s3 --env QUALITY=low --refresh
    https://us-west-1.hyperapp.io/thumbnail/82a1cae2-b08a-4e74-b890-4cf9de4c7ba8
