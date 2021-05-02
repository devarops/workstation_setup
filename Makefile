run:
	ansible-playbook workstations.yml

.PHONY: lint run

lint:
	ansible-lint workstations.yml
