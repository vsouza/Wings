PACKAGE_NAME=Wing
MODE=debug

build:
	@swift build

run: build
	@./.build/$(MODE)/$(PACKAGE_NAME)
