#!/bin/sh

_error() {
  echo -e "$1"

  if [ "${LOOSE_ERROR}" == "true" ]; then
    exit 0
  else
    exit 1
  fi
}

_wxt_checks() {
  if [ -z "${TOKEN}" ]; then
    _error "TOKEN is not set."
  fi

  if [ -z "${ROOMID}" ]; then
    _error "ROOMID is not set."
  fi

  if [ -z "${MESSAGE}" ]; then
    _error "MESSAGE is not set."
  fi
}

_wxt_message() {
  _wxt_checks

  URL="https://webexapis.com/v1/messages/"
curl \
    -X POST \
    -H "Authorization:Bearer ${TOKEN}" \
    --form "roomId=${ROOMID}" \
    --form "markdown=${MESSAGE}" \
    ${URL}
}

_wxt_message
