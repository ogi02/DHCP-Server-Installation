FROM ubuntu:22.04

RUN apt update && apt install -y isc-dhcp-client iproute2 iputils-ping

RUN rm -rf /var/lib/apt/lists/*

COPY start-client.sh /usr/local/bin/start-client.sh

RUN chmod +x /usr/local/bin/start-client.sh

ENTRYPOINT ["/usr/local/bin/start-client.sh"]

CMD ["sleep", "infinity"]
