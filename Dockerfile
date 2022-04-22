FROM ubuntu:22.04
COPY . .
RUN apt update && apt install --yes \
    ansible \
    make
COPY .config/hosts /etc/ansible/hosts
