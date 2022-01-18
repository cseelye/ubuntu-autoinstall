NAME := ubuntu-autoinstall-builder
ENV_FILE=.host_env
SHELL := /bin/bash -o pipefail
.DEFAULT_GOAL := iso

.PHONY: iso
iso: image capture_env
	docker container run --rm -it --privileged -v $$(pwd):/host --workdir /host --env-file $(ENV_FILE) $(NAME)

.PHONY: image
image:
	docker image build --quiet --tag $(NAME) . 2>&1 | sed -e 's/^/    /'

.PHONY: capture_env
capture_env:
	./capture-env $(ENV_FILE)
