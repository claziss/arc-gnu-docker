NS = claziss
REPO = arc-gnu
NAME = arc-gnu
VOLUMES = -v $PWD:/INSTALL

.PHONY: build shell run start stop stoprm rm

build:
	docker build -t $(NS)/$(REPO) .

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(ENV) $(NS)/$(REPO) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(ENV) $(NS)/$(REPO)

start:
	docker run -d --name $(NAME) $(PORTS) $(ENV) $(NS)/$(REPO)

stop:
	docker stop $(NAME)

rm:
	docker rm $(NAME)

default: build
