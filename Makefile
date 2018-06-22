GOCMD=go
GOBUILD=$(GOCMD) build
BINARY_NAME=suren

all: build

build:
  $(GOBUILD) -o $(BINARY_NAME) -v