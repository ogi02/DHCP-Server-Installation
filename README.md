# DHCP Server Installation

Course project for the discipline "Computer Networks and Network Administration" in TU-Sofia

## DHCP Server

The DHCP Server is an Ubuntu 22.04 Docker container. The configuration is copied on the container and applied. 

The configuration includes:
- Sub Network with IP `192.168.100.0` and network mask `255.255.255.0`
- Range of IP addresses assigned to clients -> `192.168.100.10` - `192.168.100.20`
- Fixed IP address for the MAC address of `client1` -> `192.168.100.19`
- Default lease time -> 10 minutes

## DHCP Clients

The DHCP Clients are Ubuntu 22.04 Docker containers. On start, they request an IP address from the DHCP server.

## Docker Setup

The `Dockerfile` and the configuration for the DHCP Server is located in `./dhcp-server`.
The `Dockerfile` for the DHCP Clients is located in `./dhcp-client`.

The repository root contains a `docker-compose.yml` file which creates the following objects:
- Docker container for a DHCP Server - `dhcp-server`
- Docker container for a DHCP Client - `dhcp-client-1`
- Docker container for a DHCP Client - `dhcp-client-2`
- Docker container for a DHCP Client - `dhcp-client-3`
- Docker bridge network - `dhcpnet` with subnet `192.168.100.0/24`

The DHCP clients are configured to depend on the DHCP server, ensuring they request IP addresses only after the server has started.

## Helpful Commands

Below are presented helpful commands for the setup and use of the DHCP server.

### Docker Compose Commands

| Command                                     | Purpose                                                              |
|---------------------------------------------|----------------------------------------------------------------------|
| `docker compose up --build -d`              | Build images and start all containers in detached mode               |
| `docker compose down`                       | Stop and remove all containers, networks, volumes created by Compose |
| `docker compose ps`                         | List running containers from this Compose project                    |
| `docker compose logs -f <container-name>`   | Follow logs of a given container in real time                        |
| `docker compose exec <container-name> bash` | Open a bash shell inside a given container                           |
| `docker network ls`                         | List all Docker networks                                             |
| `docker network inspect <network_name>`     | Show details of a network (subnets, IPs, connected containers)       |
---

### DHCP Server Commands (inside container)

| Command                                     | Purpose                                                              |
|---------------------------------------------|----------------------------------------------------------------------|
| `dhcpd -f -d -cf /etc/dhcp/dhcpd.conf eth0` | Start DHCP server in **foreground + debug** mode                     |
| `cat /var/lib/dhcp/dhcpd.leases`            | View DHCP leases (which IPs assigned to which MACs)                  |
| `rm -f /var/run/dhcpd.pid`                  | Remove old PID file before starting server (prevents startup errors) |

---

### DHCP Client Commands (inside container)

| Command                | Purpose                                            |
|------------------------|----------------------------------------------------|
| `ip addr show eth0`    | Check current IP addresses assigned to interface   |
| `ping <IP>`            | Test connectivity to another container or gateway  |

---

### DHCP Standalone Client
| Command                                                                  | Purpose                                   |
|--------------------------------------------------------------------------|-------------------------------------------|
| `docker build -t dhcp-client dhcp-client/`                               | Creates a Docker image of a DHCP Client   |
| `docker run --rm --net=dhcpnet --cap-add=NET_ADMIN -it dhcp-client bash` | Runs a DHCP client and opens its Terminal |
