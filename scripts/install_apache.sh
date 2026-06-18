#!/bin/bash

apt update -y

apt install apache2 -y

systemctl start apache2

systemctl enable apache2

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title>Terraform Auto Deploy</title>
</head>
<body>
<h1>Hello Vikram</h1>
<h2>Website deployed automatically using Terraform</h2>
</body>
</html>
EOF