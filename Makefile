NAME := ubuntu-autoinstall-builder

SHELL := /bin/bash
.DEFAULT_GOAL := iso

.PHONY: iso
iso: image
	docker container run --rm -it --privileged -v $$(pwd):/host --workdir /host $(NAME)

.PHONY: image
image:
	docker image build --tag $(NAME) . 2>&1 | sed -e 's/^/    /'
