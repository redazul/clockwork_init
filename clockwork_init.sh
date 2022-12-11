#!/bin/bash

echo "[0] get path update"
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/export_path.sh 
chmod +x export_path.sh

echo "[1] create log directory"
sudo mkdir /var/log/solana

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

echo "[6] getting update worker script"
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/update_id.py -P $HOME/clockwork/lib

echo "[6] building clockwork"
./clockwork/scripts/build-all.sh clockwork/

echo "[7] get validator script"
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/validator.sh








