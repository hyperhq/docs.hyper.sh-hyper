## func create

  Usage:	hyper func create [OPTIONS] IMAGE [COMMAND] [ARG...]

  Create a new function

    --name                   Function name
    --size=s4                The size of function containers to run the funciton (e.g. s1, s2, s3, s4, m1, m2, m3, l1, l2, l3)
    -e, --env=[]             Set environment variables
    --header=[]              The http response header of the return of a function call
    --timeout=300            The maximum execution duration of function call

Creates a new function with the specified image and options.

### Examples

**Create a function:**

    $ hyper func create --name helloworld --size s4 --header "Content-Type=text/plain" --max_limit 50 echo "Hello World"
    helloworld is created with the address of https://us-west-1.hyperfunc.io/helloworld/e5304888-f112-11e6-bc64-92361f002671
