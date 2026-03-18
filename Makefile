.PHONY: build publish clean help

help:
	@echo "Available targets:"
	@echo "  build   - Compile the image"
	@echo "  publish - Publish an image to Docker Hub"
	@echo "  clean   - Delete logs and other temporary artifacts"
	@echo "  help    - Show this help message"

build:
	./run/build

publish:
	./run/publish

clean:
	rm -rf logs/
