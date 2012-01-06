ANOLIS = anolis

all: Overview.html data/xrefs/dom/xhr.json

Overview.html: Overview.src.html data Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="XMLHttpRequest" \
	--filter=".publish" $< $@

data/xrefs/dom/xhr.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec

publish: Overview.src.html data Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="XMLHttpRequest" \
	--filter=".dontpublish" --pubdate="$(PUBDATE)" --w3c-status=WD \
	$< TR/Overview.html
