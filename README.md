# install docker 
sudo apt update

sudo apt upgrade

# stage loging

mkdir /var/log/solana

wget https://raw.githubusercontent.com/redazul/clockwork_init/main/solana-logrotate -P /etc/logrotate.d/

wget https://raw.githubusercontent.com/redazul/clockwork_init/main/validator.sh -P /root/

wget https://raw.githubusercontent.com/redazul/clockwork_init/main/monitor_validator.py -P /root/

# edit email information

wget https://raw.githubusercontent.com/redazul/clockwork_init/main/sendMail.py -P /root/
