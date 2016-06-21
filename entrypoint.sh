#!/bin/sh

echo $DIGEST > "$DIGEST_FILE"
exec lighttpd -D -f /root/lighttpd.conf

