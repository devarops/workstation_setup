all: create_server sleep host_known setup_server setup_users

.PHONY: \
	all \
	check \
	clean \
	create_server \
	destroy_server \
	format \
	host_known \
	init \
	setup_server \
	setup_users \
	sleep

check:
	ansible-lint ansible/development.yml ansible/setup_users.yml
	cd src && terraform fmt -check

clean:
	rm --force --recursive src/.terraform
	rm --force src/.terraform.lock.hcl
	rm --force src/terraform.tfstate*

create_server: init
	cd src && terraform apply -auto-approve

destroy_server: init
	cd src && terraform destroy -auto-approve -target="azurerm_linux_virtual_machine.devserver"

format:
	cd src && terraform fmt

host_known:
	cd src && \
	ssh-keyscan "$$(terraform output -raw devserver_ip)" > "$${HOME}/.ssh/known_hosts"

init:
	cd src && \
	az login --username $${AZURE_USERNAME} --password $${AZURE_PASSWORD} && \
	terraform init

setup_server:
	cd src && \
	export DEVSERVER_IP=$$(terraform output -raw devserver_ip) && \
	ansible-playbook ansible/development.yml

setup_users:
	cd src && \
	export DEVSERVER_IP=$$(terraform output -raw devserver_ip) && \
	ansible-playbook ansible/setup_users.yml

sleep:
	@echo "Waiting to avoid conflicts with APT. 😴 💤 😪"
	sleep 100
