# Configura tu entorno para desarrollo

## Autenticación mediante SSH

1. En tu estación de trabajo crea tu clave SSH con: `ssh-keygen`
1. Agrega la clave SSH pública[^ssh_pub] de tu estación de trabajo a:
    - [Bitbucket](https://bitbucket.org/account/settings/ssh-keys/),
    - [DigitalOcean](https://cloud.digitalocean.com/account/security) y
    - [GitHub](https://github.com/settings/keys/)

[^ssh_pub]: Copia el contenido del archivo `~/.ssh/id_rsa.pub` de tu estación de trabajo y pégalo en las aplicaciones indicadas

## En tu cliente liviano

- [ ] TODO: Mover esta sección a [`src/start_containers.sh`](https://github.com/IslasGECI/islasgeci.org/blob/develop/src/start_containers) de [islasgeci.org](https://github.com/IslasGECI/islasgeci.org) o al servidor donde corre el Inspector. (Las instrucciones de abajo dependen de Docker por lo que no pueden correr en los clientes livianos.)

1. Agrega tu token de accesso personal de DigitalOcean (`DO_PAT`) a tu bóveda secreta
1. Ejecuta:
```shell
source ${HOME}/.vault/.secrets
apt update && apt install --yes docker.io
docker run \
    --env DO_PAT \
    --interactive \
    --rm \
    --tty \
    --volume ${HOME}/.ssh/id_rsa:/root/.ssh/id_rsa \
    --volume ${HOME}/.vault/.secrets:/root/.vault/.secrets \
    islasgeci/development_server_setup:latest make
```
