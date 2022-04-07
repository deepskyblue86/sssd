#!/bin/sh

# ensure DB_PATH existence
if [ ! -e /var/lib/sss/db/config.ldb ]; then
    cp -r /sss_statedir/* /var/lib/sss
fi

exec /usr/sbin/sssd -c /conf/sssd.conf -i $@
