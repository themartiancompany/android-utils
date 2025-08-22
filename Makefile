#
# SPDX-License-Identifier: AGPL-3.0-or-later

_PROJECT=android-utils
PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

all:

check: shellcheck

shellcheck:

	shellcheck \
	  -s \
	    "bash" \
	  $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	install \
	  -vDm755 \
	  "$(_PROJECT)/app-installed \
	  "$(BIN_DIR)/app-installed"
	install \
	  -vDm755 \
	  "$(_PROJECT)/sdk-version" \
	  "$(BIN_DIR)/sdk-version"

install-doc:

	install \
	  -vDm644 \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
