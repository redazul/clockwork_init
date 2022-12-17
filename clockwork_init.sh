#!/bin/bash

echo "What is your worker ID ?"
read workerID

#purge old files
rm -rf export_path.sh
rm -rf validator.sh

echo "[0] get path update"
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/export_path.sh 
chmod +x export_path.sh

echo "[1] configure logging"
sudo mkdir /var/log/solana
sudo chmod 777 /var/log/solana
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/solana -O /etc/logrotate.d/solana

echo "[2] getting latest solana build"
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

echo "[3] getting rust"
curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup component add rustfmt

echo "[4] getting build dep"
sudo apt-get -y  update
sudo apt-get -y  install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang cmake make libprotobuf-dev protobuf-compiler

echo "[5] cloning clockwork" 
git clone https://github.com/clockwork-xyz/clockwork

echo "[6] building clockwork"
./clockwork/scripts/build-all.sh clockwork/

echo "[7] getting update worker script"
cd $HOME/clockwork/lib
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/update_id.py
cd ~

echo "[8] get validator script"
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/validator.sh
chmod +x validator.sh

echo "[9] update worker config"
python3 $HOME/clockwork/lib/update_id.py  $HOME/.config/solana/id.json $workerID $HOME







