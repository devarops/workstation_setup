FROM ubuntu:22.04
RUN apt update && sudo apt install --yes \
    ansible \
    make
COPY .config/hosts /etc/ansible/hosts