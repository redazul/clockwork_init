#!/bin/bash

echo "[0] get path update"
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/export_path.sh 
chmod +x export_path.sh

echo "[1] getting latest solana build"
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"


echo "[2] getting rust"
echo 1 | curl https://sh.rustup.rs -sSf | sh
rustup component add rustfmt

#echo "getting build dep"
#sudo apt-get -y  update
#sudo apt-get -y  install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang cmake make libprotobuf-dev protobuf-compiler


#echo "cloning clockwork" 
#git clone https://github.com/clockwork-xyz/clockwork

#echo "building clockwork"
#./clockwork/scripts/build-all.sh clockwork/

