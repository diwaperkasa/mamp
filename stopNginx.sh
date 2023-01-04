#!/bin/sh

if [[ -r /Applications/MAMP/Library/logs/nginx.pid ]]
then
	/Applications/MAMP/Library/bin/nginxctl stop 
fi

SOCKET=/Applications/MAMP/Library/logs/fastcgi/nginxFastCGI.sock
# remove PHP FastCGI
PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-7.1.pid

if [[ -r $PIDFILE ]]
then
    PID=`cat $PIDFILE`
    
    if [ -z $PID ]
    then
    	PID=`/bin/ps -aef | /usr/bin/grep php-cgi | /usr/bin/awk '{if($3==1){print $2}}'`
    fi
    
    /bin/kill -QUIT $PID
	rm -f $PIDFILE
fi

PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-7.2.pid

if [[ -r $PIDFILE ]]
then
    PID=`cat $PIDFILE`
    
    if [ -z $PID ]
    then
    	PID=`/bin/ps -aef | /usr/bin/grep php-cgi | /usr/bin/awk '{if($3==1){print $2}}'`
    fi
    
    /bin/kill -QUIT $PID
	rm -f $PIDFILE
fi

PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-7.3.pid

if [[ -r $PIDFILE ]]
then
    PID=`cat $PIDFILE`
    
    if [ -z $PID ]
    then
    	PID=`/bin/ps -aef | /usr/bin/grep php-cgi | /usr/bin/awk '{if($3==1){print $2}}'`
    fi
    
    /bin/kill -QUIT $PID
	rm -f $PIDFILE
fi

PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-7.4.pid

if [[ -r $PIDFILE ]]
then
    PID=`cat $PIDFILE`
    
    if [ -z $PID ]
    then
    	PID=`/bin/ps -aef | /usr/bin/grep php-cgi | /usr/bin/awk '{if($3==1){print $2}}'`
    fi
    
    /bin/kill -QUIT $PID
	rm -f $PIDFILE
fi

PIDFILE=/Applications/MAMP/Library/logs/nginxFastCGI-8.0.pid

if [[ -r $PIDFILE ]]
then
    PID=`cat $PIDFILE`
    
    if [ -z $PID ]
    then
    	PID=`/bin/ps -aef | /usr/bin/grep php-cgi | /usr/bin/awk '{if($3==1){print $2}}'`
    fi
    
    /bin/kill -QUIT $PID
	rm -f $PIDFILE
fi

if [[ -r $SOCKET ]]
then
	rm -f $SOCKET
fi
