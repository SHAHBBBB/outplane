#!/bin/sh
set -e

if [ -z "$CLIENT_UUID" ]; then
  echo "ERROR: CLIENT_UUID env var is not set" >&2
  exit 1
fi

if [ -z "$PORT" ]; then
  echo "PORT env var not set, defaulting to 8080"
  PORT=8080
fi

sed -i "s/PORT_PLACEHOLDER/${PORT}/" /etc/xray/config.json
sed -i "s/UUID_PLACEHOLDER/${CLIENT_UUID}/" /etc/xray/config.json

exec /usr/bin/xray -config /etc/xray/config.json
