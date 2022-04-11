d=$1 # domain like sub.domain.com
sudo systemctl stop nginx
sudo certbot certonly --standalone --preferred-challenges http -d $d
sudo systemctl start nginx