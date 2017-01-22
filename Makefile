NAME ?= kernel-flasher

VERSION ?= 4.1

DATE := $(shell date +'%Y%m%d-%H%M')

ZIP := $(NAME)-$(VERSION).zip

EXCLUDE := Makefile README.md *.git*

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf "$(NAME)"*.zip*
	@echo "Done."
