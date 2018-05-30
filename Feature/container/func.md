# Func

Hyper Func is a Docker-centric Serverless platform. You can wrap functions in Docker images and have them run on demand.

- Fire and forget
	- Fully managed service
    - Easy to use for developers
    - Minimal ops overhead
- Docker centric
	- Deploy your function in any Docker image
	- Any language, any libraries, any dependencies
- Secure Container Runtime
	- VM-like isolation
	- New container instance for each function call
	- Run functions for as long as you wish

## How it works

1. Hyper Func uses straight Docker images as the underlying format to deploy functions. Code, dependencies and data are baked into your Docker images and then uploaded to any popular container registry. From there you can launch functions with the runtime of your choosing.
2. Upon launch, a new container is started with the selected function image. The HTTP request payload is passed to the container STDIN as input to the function and the output is returned or a call ID is returned so you can retrieve output later.
3. The maximum number of concurrent functions is subject to the user's quota, which can be upgraded on request. When the quota limit is reached subsequent functions are queued until a slot becomes available.
4. Queued functions are processed in a **First-In-First-Out** order. We cannot however guarantee that the functions will terminate in this order.
5. Hyper Func maintains a 50MB cache for each individual function. (**Not per function call**). This cache is used to store the STDOUT of **finished** asynchronous function calls. This data therefore needs to be fetched regularly using `hyper func get`. Once the 50MB limit is reached the cache will be rotated.
6. Hyper Func maintains a 50MB cache for the logs of each function. This data needs to be fetched using `hyper func logs`. Once the cache is full the logs will be rotated.
7. For each function call, the maximum size of data flowing through STDIN and STDOUT is limited to 1MB.
8. The headers of the HTTP request and any environment configuration will be exposed as environment variables in the host container where they can be accessed by the function.

## Usage

1. Pull the ubuntu image:
```
$ hyper pull ubuntu
...
```

2. Create a "HelloWorld" function:
```
$ hyper func create --name helloworld ubuntu echo HelloWorld
helloworld is created with the address of https://us-west-1.hyperfunc.io/call/helloworld/e62c014e-386c-42ea-8d07-41d44e98cc3d
```

3. Call the function:
```
$ hyper func call helloworld
CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
```
> Tip: calling with payload `echo Hello | hyper func call helloworld`

4. Check the function logs:
```
$ hyper func logs helloworld
2017-03-16T15:05:58Z [CALL] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06, ShortStdin:
2017-03-16T15:05:58Z [PENDING] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
2017-03-16T15:06:04Z [RUNNING] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
2017-03-16T15:06:10Z [FINISHED] CallId: 218b7b10-e7f1-4c48-ac3c-66792f8ffc06, ShortStdout: HelloWorld
, ShortStderr:
```

5. Retrieve the function return:
```
$ hyper func get --wait 218b7b10-e7f1-4c48-ac3c-66792f8ffc06
HelloWorld
```
> Tip: `--wait` blocks the CLI until the call finished (or failed)

6. Remove the function:
```
$ hyper func rm helloworld
helloworld
```

## Resize picture example

1. Pull the imagemagick image:
```
$ hyper pull v4tech/imagemagick
...
```

2. Create a "resizer" function:
```
$ hyper func create --name resizer v4tech/imagemagick convert - -resize 50% fd:1
resizer is created with the address of https://us-west-1.hyperfunc.io/call/resizer/11f91366-2fea-4381-8297-dc12f6ba200a
```

3. Call the function with a picture payload:
```
$ cat picture.jpg | hyper func call --sync resizer > picture_small.jpg
```
