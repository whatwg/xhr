SHELL=/bin/bash -o pipefail
.PHONY: local remote deploy review

remote: xhr.bs
	@ (HTTP_STATUS=$$(curl https://api.csswg.org/bikeshed/ \
	                       --output xhr.html \
	                       --write-out "%{http_code}" \
	                       --header "Accept: text/plain, text/html" \
	                       -F die-on=warning \
	                       -F md-Text-Macro="COMMIT-SHA LOCAL COPY" \
	                       -F file=@xhr.bs) && \
	[[ "$$HTTP_STATUS" -eq "200" ]]) || ( \
		echo ""; cat xhr.html; echo ""; \
		rm -f xhr.html; \
		exit 22 \
	);

local: xhr.bs
	bikeshed spec xhr.bs xhr.html --md-Text-Macro="COMMIT-SHA LOCAL COPY"

deploy: xhr.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh
	bash ./deploy.sh

review: xhr.bs
	curl --remote-name --fail https://resources.whatwg.org/build/review.sh
	bash ./review.sh
