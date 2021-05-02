run:
	ansible-playbook ansible-playbook.yml

.PHONY: lint run

lint:
	ansible-lint ansible-playbook.yml
