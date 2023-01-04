#!/bin/sh

PHPVERSIONS=`ls /Applications/MAMP/bin/php`

if [[ -z $1 ]]
then
	if /usr/bin/defaults read de.appsolute.MAMP phpVersion
	then
		PHPVERSION=`/usr/bin/defaults read de.appsolute.MAMP phpVersion`
		
		if test ! -f /Applications/MAMP/bin/php/php${PHPVERSION}/bin/php-cgi 
		then
			PHPVERSION=`echo ${PHPVERSIONS} | /usr/bin/awk '{print $NF}' | cut -c 4-10`
		fi
		
	else
		PHPVERSION=`echo ${PHPVERSIONS} | /usr/bin/awk '{print $NF}' | cut -c 4-10`
	fi
else
	PHPVERSION=$1 
fi 

SOCKET=/Applications/MAMP/Library/logs/fastcgi/nginxFastCGI-7.1.sock
PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-7.1.pid

if [ ! -f $SOCKET ] && [ ! -f $PIDFILE ]
then
	CHILDREN=4
	PHPCGI=/Applications/MAMP/bin/php/php7.1.33/bin/php-cgi
	
# exec 
	/Applications/MAMP/Library/bin/spawn-fcgi -s $SOCKET -P $PIDFILE -C $CHILDREN -f $PHPCGI
fi

SOCKET=/Applications/MAMP/Library/logs/fastcgi/nginxFastCGI-7.2.sock
PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-7.2.pid

if [ ! -f $SOCKET ] && [ ! -f $PIDFILE ]
then
	CHILDREN=4
	PHPCGI=/Applications/MAMP/bin/php/php7.2.34/bin/php-cgi
	
# exec 
	/Applications/MAMP/Library/bin/spawn-fcgi -s $SOCKET -P $PIDFILE -C $CHILDREN -f $PHPCGI
fi

SOCKET=/Applications/MAMP/Library/logs/fastcgi/nginxFastCGI-7.3.sock
PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-7.3.pid

if [ ! -f $SOCKET ] && [ ! -f $PIDFILE ]
then
	CHILDREN=4
	PHPCGI=/Applications/MAMP/bin/php/php7.3.29/bin/php-cgi
	
# exec 
	/Applications/MAMP/Library/bin/spawn-fcgi -s $SOCKET -P $PIDFILE -C $CHILDREN -f $PHPCGI
fi

SOCKET=/Applications/MAMP/Library/logs/fastcgi/nginxFastCGI-7.4.sock
PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-7.4.pid

if [ ! -f $SOCKET ] && [ ! -f $PIDFILE ]
then
	CHILDREN=4
	PHPCGI=/Applications/MAMP/bin/php/php7.4.21/bin/php-cgi
	
# exec 
	/Applications/MAMP/Library/bin/spawn-fcgi -s $SOCKET -P $PIDFILE -C $CHILDREN -f $PHPCGI
fi

SOCKET=/Applications/MAMP/Library/logs/fastcgi/nginxFastCGI-8.0.sock
PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-8.0.pid

if [ ! -f $SOCKET ] && [ ! -f $PIDFILE ]
then
	CHILDREN=4
	PHPCGI=/Applications/MAMP/bin/php/php8.0.8/bin/php-cgi
	
# exec 
	/Applications/MAMP/Library/bin/spawn-fcgi -s $SOCKET -P $PIDFILE -C $CHILDREN -f $PHPCGI
fi

/Applications/MAMP/Library/bin/nginxctl start

if [[ ! -f /Applications/MAMP/Library/logs/nginx.pid ]]
then
	# stop php-cgi processes
	/Applications/MAMP/bin/stopNginx.sh
fi
