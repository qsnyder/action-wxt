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
        uses: qsnyder/action-wxt@master
        env:
          TOKEN: ${{ secrets.TOKEN }}
          ROOMID: ${{ secrets.ROOMID }}
          MESSAGE: <Insert plain or markdown-formatted text or GitHub environment variables>
```

## Environment variables to pass to container

These are environment variables required by the container and are passed along.
ENVs are in addition to the stock GitHub environment variables passed by actions into the container.

It is recommended that for `$TOKEN` and `$ROOMID` variables, to use the "secrets" vault within the repository.

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
