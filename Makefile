PACKAGE_NAME=Wing
MODE=debug

build:
	@swift build

run: build
	@./.build/$(MODE)/$(PACKAGE_NAME)

clean:
	@rm -rf Packages/
	@rm -rf .build/
