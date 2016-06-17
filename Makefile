all: build

build:
	docker build -t kiwiirc .

run:
	docker run --rm -it kiwiirc bash

start: stop
	docker run -d --name kiwiirc -p 7778:7778 \
		kiwiirc

stop:
	@docker rm -vf kiwiirc ||:

.PHONY: all build run start stop
