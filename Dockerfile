FROM ubuntu:22.04
COPY . .
RUN apt update && sudo apt install --yes \
    ansible \
    make
COPY .config/hosts /etc/ansible/hosts