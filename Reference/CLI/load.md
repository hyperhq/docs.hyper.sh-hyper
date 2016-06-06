## load

    Usage:	hyper load [OPTIONS]

    Load an image from a tar archive

      --help             Print usage
      -i, --input        Read from a remote archive file compressed with gzip, bzip, or xz
      -q, --quiet        Do not show load process

## Examples

**load image from public URL:**

     $ hyper load -i http://<bucket>.s3.amazonaws.com/public/helloworld.tar

**load image with quiet mode:**

     $ hyper load -q -i http://<bucket>.s3.amazonaws.com/public/helloworld.tar

**load image from compressed archive:**

     $ hyper load -i http://<bucket>.s3.amazonaws.com/public/helloworld.tar.gz

**load multiple images:**

     $ hyper load -i http://<bucket>.s3.amazonaws.com/public/busybox_alpine.tar

**load image from s3 pre-signed URL:**

     $ hyper load -i https://<bucket>.s3-us-west-1.amazonaws.com/private/cirros.tar?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIxxxxxxxxxxxxxxx%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20160523T120846Z&X-Amz-Expires=60&X-Amz-SignedHeaders=host&X-Amz-Signature=0eb3a3777cdc633f1bb0c05de0b950eb9bd560696eb5cffd26b493e1ea1a4fb0

**load image with basic auth:**

     $ hyper load -i http://<username>:<password>@<host_domain>/helloworld.tar
