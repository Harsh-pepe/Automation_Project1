sudo apt update -y
apache="install"
if [[ $apache != $(dpkg --get-selections nginx | awk '{print $1}') ]]
then
	echo "Here"
	sudo apt install nginx -y
fi

service="running"
if [[ $service != $(systemctl status apache2 | grep active | awk '{print $3}') ]]
then
	sudo systemctl start apache2
fi
if [[ "enabled" != $(systemctl is-enabled apache2 | grep "enabled") ]]
then
	sudo systemctl enable apache2
fi

name="Harsh"

timestamp=$(date '+%d%m%Y-%H%M%S')
cd /var/log/apache2
tar -cf /tmp/${name}-httpd-logs-${timestamp}.tar *.log
if [[ -f /tmp/${name}-httpd-logs-${timestamp}.tar ]]
then
	echo "hello"
fi
