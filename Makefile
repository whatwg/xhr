local: xhr.bs
	bikeshed spec xhr.bs xhr.html --md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

remote: xhr.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@xhr.bs > xhr.html -F md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"
