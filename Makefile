PACKAGE_NAME=Suit

build:
	@swift build

run: build
	@./.build/debug/$(PACKAGE_NAME)
