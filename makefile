default:
	hugo
	rm -rf /srv/http/isonzo.me/*
	mv public/* /srv/http/isonzo.me/
