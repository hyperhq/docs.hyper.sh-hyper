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

    $ hyper func update --refresh helloworld
    helloworld

**Clear the environment variables of a function**

    $ hyper func update --env "" helloworld
    helloworld

**Notes**

* You can use `hyper func update --refresh $name` to update the address of function.
