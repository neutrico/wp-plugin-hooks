#
# Authors:
# Copyright 2013 Peter van der Does. All rights reserved.
#

prefix=~/.config/git/wp-plugin/

# files that need mode 755
EXEC_FILES=src/hooks/commit-msg
EXEC_FILES+=src/hooks/pre-commit
EXEC_FILES+=src/hooks/post-commit
EXEC_FILES+=src/hooks/prepare-commit-msg

# files that need mode 644
SCRIPT_FILES =src/hooks/config.sh
SCRIPT_FILES+=src/hooks/gitflow-functions
SCRIPT_FILES+=src/hooks/jshint.json

CONFIG_FILE=src/hooks_config

GITIGNORE_FILE=src/info/exclude

all:
	@echo "usage: make install"


install:
	install -d -m 0755 $(prefix)/hooks/
	install -d -m 0755 $(prefix)/hooks/modules
	install -m 0755 $(EXEC_FILES) $(prefix)/hooks
	install -m 0644 $(SCRIPT_FILES) $(prefix)/hooks
	install -m 0644 $(CONFIG_FILE) $(prefix)
	install -m 0644 $(GITIGNORE_FILE) $(prefix)/info
	set -e;for i in src/hooks/filter-*; do \
		install -m 0755 "$$i" \
			$(prefix)/hooks/; \
	done
	set -e;for i in src/hooks/pre-*; do \
		install -m 0755 "$$i" \
			$(prefix)/hooks/; \
	done
	set -e;for i in src/hooks/post-*; do \
		install -m 0755 "$$i" \
			$(prefix)/hooks/; \
	done
	set -e;for i in src/hooks/modules/*; do \
		install -m 0644 "$$i" \
			$(prefix)/hooks/modules/; \
	done

uninstall:
	test -d $(prefix)
	rm -rf $(prefix)
