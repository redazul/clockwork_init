# Install docker 
sudo apt update

sudo apt upgrade

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo docker run hello-world

# Stage loging

mkdir /var/log/solana

wget https://raw.githubusercontent.com/redazul/clockwork_init/main/solana-logrotate -P /etc/logrotate.d/

wget https://raw.githubusercontent.com/redazul/clockwork_init/main/validator.sh -P /root/

wget https://raw.githubusercontent.com/redazul/clockwork_init/main/monitor_validator.py -P /root/

# Edit email information

wget https://raw.githubusercontent.com/redazul/clockwork_init/main/sendMail.py -P /root/
