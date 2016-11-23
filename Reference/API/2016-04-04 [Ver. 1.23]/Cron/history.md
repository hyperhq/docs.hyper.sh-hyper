# Show cron history

`GET /crons/(name)/history`

Show cron history.

**Example request**:

```
GET /crons/test-cron-job/history HTTP/1.1
```

**Example response**:

```
HTTP/1.1 200 OK
Content-Type: application/json

[
    {
        "Status": "success",
        "Job": "test-cron-job",
        "StartedAt": 1478862900,
        "FinishedAt": 1478862905,
        "Container": "test-cron-job-1478862900",
        "Message": "Job[test-cron-job] is success to run"
    },
    {
        "Status": "running",
        "Job": "test-cron-job",
        "StartedAt": 1478863200,
        "FinishedAt": 0,
        "Container": "test-cron-job-1478863200",
        "Message": "Job[test-cron-job] is running at 2016-11-11 11:20:00 +0000 UTC"
    }
]
```

Query Parameters

- **since** - how history since timestamp
- **tail** - Number of lines to show from the end of the history

**Status Codes**:

* 200 – no error
* 404 - no such cron job
* 500 – server error
