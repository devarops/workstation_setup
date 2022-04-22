run:
	ansible-playbook development.yml

.PHONY: \
	create_server \
	destroy_server \
	devserver lint \
	init \
	lint \
	run \
	setup_server

create_server:
	cd src && terraform apply -auto-approve -var "do_token=$${DO_PAT}" -var "pvt_key=$${HOME}/.ssh/id_rsa"

destroy_server:
	cd src && terraform destroy -auto-approve -var "do_token=$${DO_PAT}" -var "pvt_key=$${HOME}/.ssh/id_rsa"

devserver: create_server setup_server

init:
	cd src && terraform init

lint:
	ansible-lint development.yml

setup_server:
	docker pull islasgeci/development_server_setup:latest
	docker run --interactive --rm --tty --volume ${HOME}/.ssh/id_rsa:/root/.ssh/id_rsa --volume ${HOME}/.vault/.secrets:/root/.vault/.secrets islasgeci/development_server_setup:latest make