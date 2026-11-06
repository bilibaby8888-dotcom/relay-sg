#!/bin/sh
sed -i "s/__PORT__/${PORT:-10000}/; s/__UUID__/${UUID}/; s#__WSPATH__#${WSPATH}#" /usr/local/etc/xray/config.json
exec /usr/local/bin/xray run -config /usr/local/etc/xray/config.json
