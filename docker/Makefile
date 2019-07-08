.PHONY: build
build:
	docker build -t emacs-scala .

.PHONY: run
run:
	docker run -it -v $(PWD)/../.emacs.d:/root/.emacs.d emacs-scala

.PHONY: clean
clean:
	docker rmi -f emacs-scala
