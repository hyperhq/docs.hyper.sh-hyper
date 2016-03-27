# Attach to a container

`POST /containers/(id)/attach`

Attach to the container `id`

**Example request**:

    POST /containers/16253994b7c4/attach?logs=1&stream=0&stdout=1 HTTP/1.1

**Example response**:

    HTTP/1.1 101 UPGRADED
    Content-Type: application/vnd.docker.raw-stream
    Connection: Upgrade
    Upgrade: tcp

    {{ STREAM }}

Query Parameters:

-   **detachKeys** – Override the key sequence for detaching a container. 
-   **logs** – 1/True/true or 0/False/false, return logs. Default `false`.
-   **stream** – 1/True/true or 0/False/false, return stream.
        Default `false`.
-   **stdin** – 1/True/true or 0/False/false, if `stream=true`, attach
        to `stdin`. Default `false`.
-   **stdout** – 1/True/true or 0/False/false, if `logs=true`, return
        `stdout` log, if `stream=true`, attach to `stdout`. Default `false`.
-   **stderr** – 1/True/true or 0/False/false, if `logs=true`, return
        `stderr` log, if `stream=true`, attach to `stderr`. Default `false`.

Status Codes:

-   **101** – no error, hints proxy about hijacking
-   **200** – no error, no upgrade header found
-   **400** – bad parameter
-   **404** – no such container
-   **500** – server error

    **Stream details**:

    When using the TTY setting is enabled in
    [`POST /containers/create`
    ](#create-a-container),
    the stream is the raw data from the process PTY and client's `stdin`.
    When the TTY is disabled, then the stream is multiplexed to separate
    `stdout` and `stderr`.

    The format is a **Header** and a **Payload** (frame).

    **HEADER**

    The header contains the information which the stream writes (`stdout` or
    `stderr`). It also contains the size of the associated frame encoded in the
    last four bytes (`uint32`).

    It is encoded on the first eight bytes like this:

        header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}

    `STREAM_TYPE` can be:

-   0: `stdin` (is written on `stdout`)
-   1: `stdout`
-   2: `stderr`

    `SIZE1, SIZE2, SIZE3, SIZE4` are the four bytes of
    the `uint32` size encoded as big endian.

    **PAYLOAD**

    The payload is the raw stream.

    **IMPLEMENTATION**

    The simplest way to implement the Attach protocol is the following:

    1.  Read eight bytes.
    2.  Choose `stdout` or `stderr` depending on the first byte.
    3.  Extract the frame size from the last four bytes.
    4.  Read the extracted size and output it on the correct output.
    5.  Goto 1.
