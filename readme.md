# DHCP ISC Server en Docker

## Construir imagen a partir de Dockerfile

```shell
docker build -t isc-dhcp-server .
```

## Levantar contenedor

```shell
docker run -d --name isc-dhcp-server1 --net=host -v "$PWD"/config:/etc/dhcp/ isc-dhcp-server eth0
```

> `--net=host`: hace que el contenedor se comporte como su estuviera en la máquina host, ***pero solo funciona en Linux, no OSX***

## Acceder al contenedor con terminal

```shell
docker exec -it isc-dhcp-server1 bash
```

## `docker-compose`

```shell
docker-compose up --force-recreate
```

Reconstruir la imagen (o imágenes):

```shell
docker-compose up --force-recreate --build
```

## Eliminar imágenes de Docker sin etiqueta

```shell
docker rmi $(docker images -f "dangling=true" -q)
```