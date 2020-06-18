#!/bin/bash

# Configuramos la interfaz eth0 para que obtenga la IP por DHCP
echo -e "auto eth0\niface eth0 inet dhcp" >> /etc/network/interfaces
dhclient eth0 # intenta obtener una dirección para eth0
ifup eth0 && ifdown eth0 && ifup eth0
# No parar el contenedor al arrancarlo
tail -f /dev/null