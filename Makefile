run:
	ansible-playbook development.yml

.PHONY: create destroy lint run

create:
	cd src && terraform apply -var "do_token=$${DO_PAT}" -var "pvt_key=$${HOME}/.ssh/id_rsa"

destroy:
	cd src && terraform destroy -var "do_token=$${DO_PAT}" -var "pvt_key=$${HOME}/.ssh/id_rsa"

lint:
	ansible-lint development.yml