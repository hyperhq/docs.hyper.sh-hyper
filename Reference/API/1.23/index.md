# Version 1.23 (2016-04-04)

> NOTE: Parameters with the `IGNORED` mark are not supported in this version. All data passed will be ignored.

### API Endpoints

- Los Angels `us-west-1`: https://us-west-1.api.hyper.sh

### API Format
 - The API tends to be REST. However, for some complex commands, like `attach`
   or `pull`, the HTTP connection is hijacked to transport `stdout`,
   `stdin` and `stderr`.
 - When the client API version is newer than the daemon's, these calls return an HTTP
   `400 Bad Request` error message.

### Error Code
Hyper\_ has two types of error codes:

- `Client errors`: These errors are usually caused by something the client did, such as use an action or resource on behalf of a user that doesn't have permission to use the action or resource, or specify an identifier that is not valid. These errors are accompanied by a 400-series HTTP response code.
- `Server errors`: These errors are usually caused by a server-side issue. These errors are accompanied by a 500-series HTTP response code.
