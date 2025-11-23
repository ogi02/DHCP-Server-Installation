#!/bin/bash

# Request DHCP lease
sleep 3
dhclient eth0

# Execute the command provided at runtime
exec "$@"
