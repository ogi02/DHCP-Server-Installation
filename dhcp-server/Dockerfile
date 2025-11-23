FROM ubuntu:22.04

RUN apt-get update && apt-get install -y isc-dhcp-server iputils-ping && rm -rf /var/lib/apt/lists/*

COPY dhcpd.conf /etc/dhcp/dhcpd.conf

RUN rm -f /var/run/dhcpd.pid && rm -f /var/lib/dhcp/dhcpd.leases~

RUN mkdir -p /var/lib/dhcp && touch /var/lib/dhcp/dhcpd.leases

COPY start-server.sh /usr/local/bin/start-server.sh

RUN chmod +x /usr/local/bin/start-server.sh

ENTRYPOINT ["/usr/local/bin/start-server.sh"]
