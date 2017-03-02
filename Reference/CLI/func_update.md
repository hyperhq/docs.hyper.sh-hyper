## func update

  Usage:	hyper func update [OPTIONS] NAME

  Update a function

    --size=s4                The size of containers to run the function (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
    -e, --env=[]             Set environment variables
    --header=[]              The http response header of the endpoint of function status query
    --timeout=300            The maximum execution duration of function call
    --refresh                Whether to regenerate the uuid of function

### Examples

**Update a function:**

    $ hyper func update --size s3 --refresh helloworld
    https://us-west-1.hyperapp.io/helloworld/ba06ca01-8366-4331-8c6b-f81b096f6f66

**Notes**

* You can use `hyper func update --refresh $name` to update the endpoint of function.
