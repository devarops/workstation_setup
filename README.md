# Configura tu entorno para desarrollo

## Autenticación mediante SSH

1. En tu estación de trabajo crea tu clave SSH con: `ssh-keygen`
1. Agrega la clave SSH pública[^ssh_pub] de tu estación de trabajo a:
    - [Bitbucket](https://bitbucket.org/account/settings/ssh-keys/),
    - [DigitalOcean](https://cloud.digitalocean.com/account/security) y
    - [GitHub](https://github.com/settings/keys/)

[^ssh_pub]: Copia el contenido del archivo `~/.ssh/id_rsa.pub` de tu estación de trabajo y pégalo en las aplicaciones indicadas

## En tu cliente liviano

> TODO: Mover esta sección a [`src/start_containers.sh`](https://github.com/IslasGECI/islasgeci.org/blob/develop/src/start_containers) de [islasgeci.org](https://github.com/IslasGECI/islasgeci.org)

Para crear el servidor, ejecuta: `make --makefile=build/Makefike`.
