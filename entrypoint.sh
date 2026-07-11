#!/bin/sh
set -e

# Variable abstraction
_p_val=${PORT:-8080}
_u_val=$CLIENT_UUID

# Validation gate
if [ -z "$_u_val" ]; then
    printf "Runtime Error: [0x101] Initializer missing required token\n" >&2
    exit 1
fi

# Dynamic manifest update
_cfg_file="/etc/xray/config.json"
sed -i "s/PORT_PLACEHOLDER/$_p_val/g" $_cfg_file
sed -i "s/UUID_PLACEHOLDER/$_u_val/g" $_cfg_file

# Launching core process
exec /usr/bin/xray -config $_cfg_file
