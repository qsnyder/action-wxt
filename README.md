# Action-WXT
A simple GitHub action to post a message to Webex Teams via REST API into Webex Cloud.
Requires several `ENV` variables to be passed into the container (token, room ID, and message to be sent).  Message supports both plaintext and markdown format

## Usage

```yaml
name: Post message to WxT

on: push

jobs:
  wxt:
    runs-on: ubuntu-latest
    steps:

      - name: Post message to WxT
        uses: qsnyder/action-wxt@v1
        env:
          TOKEN: ${{TOKEN}}
          ROOMID: ${{ROOMID}}
          MESSAGE: ${{MESSAGE}}
```

## Environment variables to pass to container

Name | Description | Default | Required
---- | ----------- | ------- | --------
TOKEN | Bot bearer token| None | **Yes**
ROOMID | RoomID to post to | None | **Yes**
MESSAGE | Message to send (text or MD) | None | **Yes**

## Running command

```bash
URL="https://api.ciscospark.com/v1/messages/"
curl \
  -X POST \
  -H "Authorization:Bearer ${TOKEN}" \
  --form "roomId=${ROOMID}" \
  --form "markdown=${MESSAGE}" \
  ${URL}
```