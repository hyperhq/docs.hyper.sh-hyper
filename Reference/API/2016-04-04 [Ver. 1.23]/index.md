# 2016-04-04 [Ver. 1.23]

> NOTE: Parameters with the `IGNORED` mark are not supported in this version. Parameter value will be ignored.

### Endpoints

- Los Angeles: https://us-west-1.hyper.sh/v1.23
- Frankfurt: https://eu-central-1.hyper.sh/v1.23

### Format
 - The API tends to be REST. However, for some complex commands, like `attach`
   or `pull`, the HTTP connection is hijacked to transport `stdout`,
   `stdin` and `stderr`.
 - When the client API version is newer than the daemon's, these calls return an HTTP
   `400 Bad Request` error message.

### Authentication
Authenticate your account when using the API by signing the request with your access key ID and secret access key. You can manage your API keys in the [console](https://console.hyper.sh).

Hyper.sh API signature algorithm is based on [AWS Signature Version 4](http://docs.aws.amazon.com/general/latest/gr/sigv4_signing.html), and there are several open source SDKs available:

- `Go`: [hyperhq/hypercli](https://github.com/hyperhq/hypercli/blob/302a6b530148f6a777cd6b8772f706ab5e3da46b/vendor/src/github.com/docker/engine-api/client/sign4.go#L73)
- `Ruby`: [drish/hyperb](https://github.com/drish/hyperb)
- `Python`: [tardyp/hyper_sh](https://github.com/tardyp/hyper_sh/blob/master/hyper_sh/requests_aws4auth/aws4auth.py)
- `NodeJS/Javascript`: [npm: hyper-aws4](https://www.npmjs.com/package/hyper-aws4)

> **NOTE: Difference between Hyper.sh Signature and AWS Signature V4**
> - Use host, region, service name of Hyper instead of AWS.
> - Change the HTTP headers `X-AMZ-*` to `X-Hyper-*`
> - Change the literatures with `"AWS"` to `"HYPER"`

### Error Codes
Hyper.sh has two types of error codes:

- `Client errors`: These errors are usually caused by something the client did, such as use an action or resource on behalf of a user that doesn't have permission to use the action or resource, or specify an identifier that is not valid. These errors are accompanied by a 400-series HTTP response code.
- `Server errors`: These errors are usually caused by a server-side issue. These errors are accompanied by a 500-series HTTP response code.

### Example

#### Step 0: Prepare the requests

The signed requests must include the following headers:

- `Content-Type`, default value is `application/json`
- `X-Hyper-Date`, the API timestamps, default value `20060102T150405Z` (UTC time)
- `Host`, the API endpoint, for example `us-west-1.hyper.sh`

#### Step 1: Create a canonical request

Hash the request body with **SHA256**, and write the hash in the Header `X-Hyper-Content-Sha256`.

Then, collect the headers to be hashed, including `Content-Type`, `Content-Md5`, `Host`, and all headers with `X-Hyper-` prefix. The headers are sorted by alphabet with the header name (lowercase) as key. Note, if the `Host` header contains a port, such as `us-west-1.hyper.sh:443`, the `:port` part will be dropped.

The `headersTobeSign` are joined with colon (`:`) and newline (`\n`), for example:

```
content-type:application/md5\nhost:us-west-1.hyper.sh\nx-hyper-content-sha256:111222333aaabbbcccddde\nx-hyper-date:20060102T150405Z\n
```

Then, join the headers with semicolon, for example

```
content-type;host;x-hyper-content-sha256;x-hyper-date
```

Then we could get the canonical request, which joins the following parts with newline(`\n`): request method, URI path, query string, the above `headersTobeSign`, the header list, and the hash of payload.

And we calculate the SHA256 checksum of Canonical Request.

#### Step 2:  Create a String to Sign

The string to sign contains 4 parts, and joined with newline(`\n`):

- Algorithm: literature `"HYPER-HMAC-SHA256"`
- Request time stamp
- Request scope, includes the following parts joined with slash(`/`)
  - Region: default is `us-west-1`
  - Service: default is `hyper`
  - Date: first 8 bytes of timestamp, e.g. the date part.
  - Literature `"hyper_request"`
- The hex string of hashed canonical request got in step 1

#### Step 3: Calculate the signature

Use the HMAC SHA256 Algorithm to sign the request, we call it several times to get the signing key firstly:

```
kDate := hmacSHA256((keyPartsPrefix+secretKey), date)
kRegion := hmacSHA256(kDate, region)
kService := hmacSHA256(kRegion, service)
kSigning := hmacSHA256(kService, keyPartsRequest)
```

In the above code,

- `keyPartsPrefix` is `"HYPER"`,
- `secretKey` is the user's secretKey
- `region` and `service` are got in step 2, and
- `keyPartsRequest` is `"hyper_request"`

Having gotten the kSigning, we calculate the Signature of the string in step 2 with another `hmacSHA256`:

`hmacSHA256(signingKey, stringToSign)`

#### Step4: Add the signature to the request

The signature will be inserted as `Authorization` header, the content are

```
HYPER-HMAC-SHA256  Credential={AccessKey}/{Request Scope}, SignedHeaders={Signed Header}, Signature={Signature}
```

Where the

- `{AccessKey}` is the AccessKey of the user;
- `{Request Scope}` is the request scope in step 2;
- `{Signed Header}` is the semicolon joined header list in Step 1;
- `{Signature}` is the signature we got in Step 3.
