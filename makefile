default:
	hugo
	rm -rf /var/www/html/isonzo.me/*
	mv public/* /var/www/html/isonzo.me/
