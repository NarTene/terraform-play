#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Hello, Welcome. This server is launched by Narcisse." >/var/www/html/index.html