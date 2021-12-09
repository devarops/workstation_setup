run:
	ansible-playbook workstation_setup.yml

.PHONY: lint run

lint:
	ansible-lint workstation_setup.yml
