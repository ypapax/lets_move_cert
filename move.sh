# https://ivanderevianko.com/2019/03/migrate-letsencrypt-certificates-certbot-to-new-server
set -ex
d=$1 # domain like sub.someDomain.com
t=$2 # target server like user@ip

remoteFolder=/
sudo tar -chvzf certs.tar.gz /etc/letsencrypt/archive/$d /etc/letsencrypt/renewal/$d.conf
scp certs.tar.gz $t:$remoteFolder

ssh $t "cd $remoteFolder; tar -xvf certs.tar.gz"

ssh $t "sudo ln -s /etc/letsencrypt/archive/$d/cert2.pem /etc/letsencrypt/live/$d/cert.pem"
ssh $t "sudo ln -s /etc/letsencrypt/archive/$d/chain2.pem /etc/letsencrypt/live/$d/chain.pem"
ssh $t "sudo ln -s /etc/letsencrypt/archive/$d/fullchain2.pem /etc/letsencrypt/live/$d/fullchain.pem"
ssh $t "sudo ln -s /etc/letsencrypt/archive/$d/privkey2.pem /etc/letsencrypt/live/$d/privkey.pem"


