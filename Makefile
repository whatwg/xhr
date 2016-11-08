local: xhr.bs
	bikeshed

remote: xhr.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@xhr.bs > xhr.html
