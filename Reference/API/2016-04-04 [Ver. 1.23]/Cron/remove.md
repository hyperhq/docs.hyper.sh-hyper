# Remove a cron job

`DELETE /crons/(name)`

Remove the cron `name`

**Example request**:

    DELETE /crons/test-cron-job HTTP/1.1

**Example response**:

    HTTP/1.1 204

Status Codes:

* 204 - no error
* 404 – no such cron job
* 500 – server error
