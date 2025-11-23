#!/bin/bash
# Remove old PID file
rm -f /var/run/dhcpd.pid

# Clean old leases
rm -f /var/lib/dhcp/dhcpd.leases~

# Start DHCP server
exec dhcpd -f -d -cf /etc/dhcp/dhcpd.conf eth0
