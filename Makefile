PACKAGE_NAME=Wing

build:
	@swift build

run: build
	@./.build/debug/$(PACKAGE_NAME)
