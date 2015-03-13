#!/bin/bash
set -e

readonly PIDFILE="/tmp/haproxy.pid"
readonly CONFFILE="/usr/local/etc/haproxy/haproxy.cfg"
readonly HAPROXY_CMD="haproxy -f $CONFFILE -p $PIDFILE"

trap reload_haproxy SIGHUP
trap exit SIGINT SIGTERM

reload_haproxy() {
    echo " [*] Reloading haproxy"
    $HAPROXY_CMD -sf $(cat $PIDFILE) &
}

main() {
    $HAPROXY_CMD &
}

main

while true; do sleep 1; done
