#!/bin/bash

echo "getting latest solana build"
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
echo "updated bin"

echo "getting rust"
#curl https://sh.rustup.rs -sSf | sh
#source $HOME/.cargo/env
#rustup component add rustfmt

#echo "getting build dep"
#sudo apt-get -y  update
#sudo apt-get -y  install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang cmake make libprotobuf-dev protobuf-compiler


#echo "cloning clockwork" 
#git clone https://github.com/clockwork-xyz/clockwork

#echo "building clockwork"
#./clockwork/scripts/build-all.sh clockwork/

