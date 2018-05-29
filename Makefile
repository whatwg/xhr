remote: xhr.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@xhr.bs > xhr.html -F md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

local: xhr.bs
	bikeshed spec xhr.bs xhr.html --md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

deploy: xhr.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh && bash ./deploy.sh

review: xhr.bs
	curl --remote-name --fail https://resources.whatwg.org/build/review.sh && bash ./review.sh
