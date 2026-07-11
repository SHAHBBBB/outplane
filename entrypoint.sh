#!/bin/sh
set -e

# Inline validation and assignment
: "${CLIENT_UUID?ERROR: CLIENT_UUID is required}"
_p=${PORT:-8080}

# Apply config modifications in one go
sed -i "s/PORT_PLACEHOLDER/$_p/g; s/UUID_PLACEHOLDER/$CLIENT_UUID/g" /etc/xray/config.json

# Execute primary process
exec /usr/bin/xray -config /etc/xray/config.json
