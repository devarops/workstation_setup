run:
	ansible-playbook development.yml

.PHONY: lint run

lint:
	ansible-lint development.yml
