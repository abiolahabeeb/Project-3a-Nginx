#!/bin/bash -ex
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo bash -c 'cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Nginx</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <h2>Welcome to Nginx Server</h2>
</body>
</html>
EOF'
sudo systemctl restart nginx







