## func update

  Usage:	hyper func update [OPTIONS] NAME

  Update a function

    -e, --env=[]       Set environment variables
    --env-file=[]      Read in a file of environment variables
    --help             Print usage
    --refresh          Whether to regenerate the uuid of function
    --size             The size of function containers to run the funciton (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
    --timeout          The maximum execution duration of function call

### Examples

**Update the address of a function:**

    $ hyper func update --size s3 --refresh helloworld
    https://us-west-1.hyperapp.io/helloworld/ba06ca01-8366-4331-8c6b-f81b096f6f66

**Clear the environment variables of a function**

    $ hyper func update --env "" helloworld
    Function helloworld is updated.

**Notes**

* You can use `hyper func update --refresh $name` to update the endpoint of function.
