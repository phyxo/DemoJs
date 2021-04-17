DIST=.dist
PLUGIN_NAME=$(shell basename `pwd`)
PLUGIN_VERSION=$(shell grep 'version:' ./config.yaml| sed -e 's/.*version: //')
SOURCE=./*
TARGET=../target

default:;

config: clean
	mkdir -p $(DIST)/$(PLUGIN_NAME)
	cp -pr *.php config.yaml js $(DIST)/$(PLUGIN_NAME)/
	find $(DIST) -name '*~' -exec rm \{\} \;

dist: config
	cd $(DIST); \
	mkdir -p $(TARGET); \
	rm $(TARGET)/$(PLUGIN_NAME)-$(PLUGIN_VERSION).zip ; \
	zip -v -r9 $(TARGET)/$(PLUGIN_NAME)-$(PLUGIN_VERSION).zip $(PLUGIN_NAME) ; \
	cd ..

manifest:
	@find ./ -type f|egrep -v '(*~|.git|.gitignore|.dist|target|modele|Makefile|rsync_exclude)'|sed -e 's/\.\///' -e 's/\(.*\)/$(PLUGIN_NAME)\/&/'> ./MANIFEST

clean:
	rm -fr $(DIST)
