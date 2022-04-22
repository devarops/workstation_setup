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

## En tu cliente liviano

Para configurar el servidor, ejecuta lo siguiente:

``` shell
docker pull islasgeci/development_server_setup:latest
docker run --interactive --rm --tty --volume ${HOME}/.ssh/id_rsa:/root/.ssh/id_rsa --volume ${HOME}/.vault/.secrets:/root/.vault/.secrets islasgeci/development_server_setup:latest make
```

- [ ] Eliminar la confirmación manual de verificación de calves SSH; actualmente `docker run` es interactivo
- [ ] Mover esta sección a [`src/start_containers.sh`](https://github.com/IslasGECI/islasgeci.org/blob/develop/src/start_containers) de [islasgeci.org](https://github.com/IslasGECI/islasgeci.org) (no podemos correr Docker en los clientes livianos)

### Perzonaliza la cuenta del equipo

Personalizar el entorno de desarrollo del equipo.

1. Entra mediante `ssh root@islasgeci.dev`
2. Ejecuta:
```shell
mkdir --parents ~/repositorios
git clone --bare git@github.com:IslasGECI/dotfiles.git ~/repositorios/dotfiles.git
git --git-dir=${HOME}/repositorios/dotfiles.git --work-tree=${HOME} checkout
git --git-dir=${HOME}/repositorios/dotfiles.git --work-tree=${HOME} config --local status.showUntrackedFiles no
source ~/.profile
```

- [ ] Mueve el bloque de código anterio a un _script_
- [ ] Mueve esto al _playbook_

### Crea una cuenta de usuario (opcional)

Opcionalmente, puedes crear una cuenta de usuario para personalizar tu entorno de desarrollo.

1. Entra mediante `ssh root@islasgeci.dev`
2. Ejecuta:
```shell
export NEW_USERNAME=<GITHUB USERNAME>
adduser $NEW_USERNAME
usermod -aG sudo $NEW_USERNAME
su - $NEW_USERNAME
mkdir --parents ~/repositorios
git clone --bare git@github.com:$USER/dotfiles.git ~/repositorios/dotfiles.git
git --git-dir=${HOME}/repositorios/dotfiles.git --work-tree=${HOME} checkout
git --git-dir=${HOME}/repositorios/dotfiles.git --work-tree=${HOME} config --local status.showUntrackedFiles no
source ~/.profile
```

- [ ] Mueve el bloque de código anterio a un _script_

### Ejemplos de repositorios `dotfiles`

- [IslasGECI](https://github.com/IslasGECI/dotfiles)
- [devarops](https://github.com/devarops/dotfiles)
