# Configura tu entorno para desarrollo

## Autenticación mediante SSH

1. En tu estación de trabajo crea tu clave SSH con: `ssh-keygen`
1. Agrega la clave SSH pública[^ssh_pub] de tu estación de trabajo a:
    - [Bitbucket](https://bitbucket.org/account/settings/ssh-keys/),
    - [DigitalOcean](https://cloud.digitalocean.com/account/security) y
    - [GitHub](https://github.com/settings/keys/)

[^ssh_pub]: Copia el contenido del archivo `~/.ssh/id_rsa.pub` de tu estación de trabajo y pégalo en las aplicaciones indicadas

## En DigitalOcean

1. [Crea una Droplet](https://cloud.digitalocean.com/droplets/new)
    - Selecciona la región correspondiente a la IP flotante (actualmente es San Francisco 3: SFO3)
    - Selecciona las claves SSH de todos los miembros del equipo como medio de autenticación
    - En el campo _Choose a hostname_, escribe `devserver`:
 
![image](https://user-images.githubusercontent.com/35377740/164117896-95a0edb4-c59a-42cc-855f-0745d591321c.png)
1. [Reasigna la IP](https://cloud.digitalocean.com/networking/floating_ips) flotante correspondiente a la Droplet nueva

## En tu estación de trabajo

> TODO: Mover esta sección a [`src/start_containers.sh`](https://github.com/IslasGECI/islasgeci.org/blob/develop/src/start_containers) de [islasgeci.org](https://github.com/IslasGECI/islasgeci.org)

Para configurar el servidor, ejecuta lo siguiente:

``` shell
docker pull islasgeci/development_server_setup:latest
docker run --rm --volume ${HOME}/.ssh/id_rsa:/root/.ssh/id_rsa --volume ${HOME}/.vault/.secret:/root/.vault/.secret islasgeci/development_server_setup:latest make
```
