# Create a volume

`POST /volumes/initialize`
`PUT /volumes/uploadfinish`

Intialize a volume

## Initialize with a remote source

**Request**:

    POST /volumes/initialize HTTP/1.1
    Content-Type: application/json

    {
      "Volume": [
        {
          "Name": "vol1",
          "Source": "https://raw.githubusercontent.com/hyperhq/hypercli/master/README.md"
        }
      ]
    }

**Response**:

    HTTP/1.1 200 OK

JSON Parameters:

- **Name** - The name of volume to be initialized.
- **Source** - Source to be used to initialize the volume.

Status Codes:

- **200** - no error
- **400**  - bad request

## Initialize with a local source

Initializing a volume with local source is devided into three steps:

1.   Ask to initialize
2.   Upload data
3.   Finish initialize

### Ask to initialize

**Request**:

    POST /volumes/initialize HTTP/1.1
    Content-Type: application/json

    {
      "Volume": [
        {
          "Name": "vol2",
          "Source": "/local/dir/foo/bar"
        }
      ]
    }

**Response**:

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "Session": "ab2b32286a13cd798e89ddb80f3e4a1dd723615e24e9713056f2285da401611e",
      "Cookie": "c95a72d51b2f9972e645d5d9645c3f5d406fe552e9dc406525573f70d95d1b1e",
      "Uploaders": {
	      "vol2":"http://0.1.2.3/data0"
      }
    }

After receiving HTTP OK, you have at most 30 minutes to upload your data to destination `http://0.1.2.3/data0`, using the provided cookie in `application/x-tar` format.

### Upload data

**Request**:

    POST http://0.1.2.3/data0?cookie=k
    Content-Type: application/x-tar

Query Parameters:

-    **cookie**: must match the cookie as returned in volume initialize response.

**Response**:

    HTTP/1.1 200 OK

### Finish initialize

**Request**:

    PUT /volumes/uploadfinish?session=s HTTP/1.1

Query Parameters:

-    **Session**: must match the session as returned in volume initialize response.

**Response**:

    HTTP/1.1 200 OK

Status Codes:

- **200** - no error
- **400**  - bad request
