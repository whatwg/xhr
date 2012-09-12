ANOLIS = anolis

all: Overview.html data/xrefs/dom/xhr.json

Overview.html: Overview.src.html data Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs \
	--filter=".publish, .now3c" $< $@

data/xrefs/dom/xhr.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
