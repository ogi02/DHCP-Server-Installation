#!/bin/bash

# Request DHCP lease
sleep 3
dhclient -nw eth0

# Execute the command provided at runtime
exec "$@"
