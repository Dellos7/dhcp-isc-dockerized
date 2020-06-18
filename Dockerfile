FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y isc-dhcp-server \
    && apt-get install -y vim \
    && apt-get install -y net-tools \
    && apt-get install -y iputils-ping
# iputils-ping --> instala "ping"
# net-tools --> instala "ifconfig"

COPY ./config/dhcpd.conf /etc/dhcp/dhcpd.conf

# Si no se crea el fichero no funciona. Es la base de datos de las IPs asignadas a los clientes
RUN touch /var/lib/dhcp/dhcpd.leases
ENTRYPOINT [ "/usr/sbin/dhcpd", "-d" ]