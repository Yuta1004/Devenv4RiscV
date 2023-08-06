IMAGE := riscv/devenv

runenv:
	docker run --rm -it -v $(shell pwd):/workdir -w /workdir $(IMAGE) /bin/bash

c:
	docker run --rm -it -v $(shell pwd):/workdir -w /workdir $(IMAGE) /bin/bash -c "make -C c"
	sudo chown $(shell id -u):$(shell id -u) c/main*

image:
	docker build -t $(IMAGE) .

clean:
	make -C c clean

.PHONY:	runenv c image
