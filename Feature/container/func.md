# Func (Beta)

In Hyper.sh, func is a serverless service that runs jobs via endpoint we provided.

## Examples

Create a func which will output "World":

	$ hyper func create --name helloworld ubuntu echo "World"

Query logs of the func:

  $ hyper func logs helloworld

Call the func:

  $ hyper call helloworld
  Request ID: 7f713fff-a65c-4004-b195-72b0c7bce84a

Query output of the func:

  $ hyper func get --wait 7f713fff-a65c-4004-b195-72b0c7bce84a
  World

Remove the func:

  $ hyper func rm helloworld

## Notes
* Func has a limitation of container quota, open the [Account](https://console.hyper.sh/account/) page to request increase.
* Every func includes 50MB of free space for STDIN and STDOUT data (with rotation).
