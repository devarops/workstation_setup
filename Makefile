devserver: init create_server know_host setup_server setup_users

.PHONY: \
	create_server \
	destroy_server \
	devserver \
	init \
	know_host \
	linter \
	setup_server \
	setup_users

create_server:
	cd src && terraform apply -auto-approve -var "do_token=$${DO_PAT}" -var "pvt_key=$${HOME}/.ssh/id_rsa"

destroy_server:
	cd src && terraform destroy -auto-approve -var "do_token=$${DO_PAT}" -var "pvt_key=$${HOME}/.ssh/id_rsa"

init:
	cd src && terraform init

know_host:
	ssh-keygen -f "$${HOME}/.ssh/known_hosts" -R "islasgeci.dev"
	ssh-keyscan "islasgeci.dev" >> "$${HOME}/.ssh/known_hosts"

format:
	cd src && terraform fmt

linter:
	ansible-lint development.yml

setup_server:
	ansible-playbook development.yml

setup_users:
	ansible-playbook setup_users.yml
