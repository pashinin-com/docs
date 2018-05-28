#!/usr/bin/make -f
# Makefile to build translations

# Languages which we translate
LANGUAGES=en ru

# Names of pages, this is hardcoded to allow ordering
PAGES=index intro require setup config transformations faq developers vendors copyright credits glossary privileges charts relations other user import_export bookmarks

# Documentation source dir
SOURCE_DIR=en/

# Name of Gettext templates
TEMPLATES=$(addprefix locale/,$(addsuffix .pot,$(PAGES)))

# Symlinked fake mo files
FAKE_MOFILES=$(foreach lang,$(LANGUAGES),$(addsuffix .mo, $(addprefix translated/$(lang)/LC_MESSAGES/, $(PAGES))))

POFILES=$(addsuffix .po, $(addprefix po/,$(LANGUAGES)))
MOFILES=$(addsuffix .mo, $(addprefix po/,$(LANGUAGES)))
INDEXFILES=$(addsuffix /index.html, $(addprefix output/,$(LANGUAGES)))

CONFIGS=$(addsuffix /conf.py, $(addprefix docs/,$(languages)))

all: $(FAKE_MOFILES) $(MOFILES) $(CONFIGS)

SECONDARY: $(POFILES) $(INDEXFILES)
.phony: all html $(addprefix html-,$(LANGUAGES))

docs/%/conf.py: $(SOURCE_DIR)conf.py Makefile
	@mkdir -p docs/$*
	@cd docs/$* && ln -sf ../../$(SOURCE_DIR)* .
	@rm -f $@
	@sed 's/#language = None/language = "$*"\nlocale_dirs = ["..\/..\/translated\/"]/' $< > $@

locale/%.pot: $(addprefix $(SOURCE_DIR), $(addsuffix .rst, $(PAGES)))
	@make -C $(SOURCE_DIR) gettext BUILDDIR=`pwd`

po/documentation.pot: $(TEMPLATES)
	@echo "UPDATE $@"
	@msgcat -o $@ $(TEMPLATES)
	@sed -i 's/Report-Msgid-Bugs-To: [^"]*/Report-Msgid-Bugs-To: translators@phpmyadmin.net\\n/' $@

po/%.po: po/documentation.pot phpmyadmin/po/%.po
	@echo "UPDATE $@"
	@if [ ! -f $@ ] ; then msginit --no-translator -i $< -o $@ ; else msgmerge --previous -U $@ -C phpmyadmin/$@ $< ; fi

po/%.mo: po/%.po
	@echo "GEN $@"
	@msgfmt $< -o $@

translated/%.mo:
	@mkdir -p $(dir $@)
	@ln -sf ../../../po/`echo $@ | sed 's@translated/\(.*\)/LC_MESSAGES.*@\1@'`.mo $@

html: $(addprefix html-,$(LANGUAGES))

html-%: output/%/index.html
	@echo

output/%/index.html: po/%.mo
	@echo "HTML $*"
	@mkdir -p "output/$*"
	@sphinx-build docs/$*/ output/$*

links:
	ln -sf ../en/index.rst ru/index.rst
	ln -sf ../en/Makefile ru/Makefile
