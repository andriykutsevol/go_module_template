
GOPATH_DIR := $(PWD)
GOPATH_DIR := $(shell dirname $(GOPATH_DIR))

set_vars:
	go env -w GO111MODULE=on
	mkdir -p ../GOPATH
	go env -w GOPATH=$(GOPATH_DIR)/GOPATH
	


install_deps:
	$(MAKE) set_vars
	rm -f go.mod go.sum
	go mod init go mod init github.com/andriykutsevol/go_module_template
	go mod tidy

build:
	$(MAKE) set_vars
	go build

install:
	go install	

test:
	go test -v ./...