.POSIX:

env ?= "prod"

default: boot cluster

~/.ssh/id_ed25519:
	ssh-keygen -t ed25519 -f "$@"

boot: ~/.ssh/id_ed25519
	ansible-playbook \
		--inventory inventories/${env}.yml \
		boot.yml

cluster:
	ansible-playbook \
		--inventory inventories/${env}.yml \
		cluster.yml

console:
	ansible-console \
		--inventory inventories/${env}.yml

k3d:
	command -v k3d
	k3d cluster create --config k3d-dev.yaml
	k3d kubeconfig get homelab-dev > kubeconfig.yaml
