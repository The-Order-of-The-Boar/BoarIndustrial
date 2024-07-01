CONTAINER_MANAGER=podman

IMAGE_NAME=industrial_boar_image
CONTAINER_RUN_COMMAND=$(CONTAINER_MANAGER) container run --workdir=/industrial_boar -v .:/industrial_boar $(IMAGE_NAME)
HOST_PACKAGE_INSTALL_COMMAND=sudo apt-get -y install



image:
	$(CONTAINER_MANAGER) image build -t $(IMAGE_NAME) .

init:
	$(CONTAINER_RUN_COMMAND) ./init.sh

install_runtime_dependencies_apt:
	$(HOST_PACKAGE_INSTALL_COMMAND) libsdl2-2.0-0 libsdl2-image-dev

setup: image init install_runtime_dependencies_apt


build:
	$(CONTAINER_RUN_COMMAND) ./build.sh Debug

run: build
	./run.sh Debug

make test:
	$(CONTAINER_RUN_COMMAND) ./test.sh Debug


clean:
	rm -r build

full_clean: clean
	rm -r vcpkg


.PHONY: image init install_runtime_dependencies_apt setup build run clean full_clean