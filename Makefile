DOCKER ?= $(shell which docker || which podman)
VERSION = $(shell curl -s 'https://api.github.com/repos/wabarc/wayback/tags?per_page=1' | grep '"name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed -e 's/v//g')
AMD64 = "https://github.com/wabarc/wayback/releases/download/v$(VERSION)/wayback-darwin-amd64-$(VERSION).tar.gz"
ARM64 = "https://github.com/wabarc/wayback/releases/download/v$(VERSION)/wayback-darwin-arm64-$(VERSION).tar.gz"

.PHONY: all
all: manifest build

.PHONY: build
build:
	$(DOCKER) build -t brew-builder .
	$(DOCKER) run --rm brew-builder

.PHONY: manifest
manifest:
	@echo 'Replace download URI'
	@$(shell sed -Ei 's/download\/v[0-9]+\.[0-9]+\.[0-9]+/download\/v$(VERSION)/g' ./Formula/wayback.rb)
	@$(shell sed -Ei 's/amd64-[0-9]+\.[0-9]+\.[0-9]+/amd64-$(VERSION)/g' ./Formula/wayback.rb)
	@$(shell sed -Ei 's/arm64-[0-9]+\.[0-9]+\.[0-9]+/arm64-$(VERSION)/g' ./Formula/wayback.rb)
	@echo 'Replace version'
	@$(shell sed -Ei 's/version "[0-9]+\.[0-9]+\.[0-9]+"/version "$(VERSION)"/g' ./Formula/wayback.rb)
	@echo 'Replace digest'
	$(shell sed -Ei 's/sha256 ".*" \# Intel/sha256 "$(shell wget -qO- $(AMD64) | sha256sum | sed -e 's/\s*-//g')" \# Intel/g' ./Formula/wayback.rb)
	$(shell sed -Ei 's/sha256 ".*" \# Apple Silicon/sha256 "$(shell wget -qO- $(ARM64) | sha256sum | sed -e 's/\s*-//g')" \# Apple Silicon/g' ./Formula/wayback.rb)

.PHONY: publish
publish:
	git commit -am "Release v$(VERSION)"
	git push origin main
