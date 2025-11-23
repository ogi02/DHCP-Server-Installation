#!/bin/bash
# Remove old PID file
rm -f /var/run/dhcpd.pid

# Optional: clean old leases
rm -f /var/lib/dhcp/dhcpd.leases~

# Start DHCP server in foreground with debug
exec dhcpd -f -d -cf /etc/dhcp/dhcpd.conf eth0
