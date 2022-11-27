#!/bin/bash

echo "getting latest solana build"
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"

echo "removing old clockwork directory"
rm -rf clockwork

echo "getting rust"
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rustfmt

sudo apt-get update
sudo apt-get install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang cmake make libprotobuf-dev protobuf-compiler


echo cloning clockwork 
git clone https://github.com/clockwork-xyz/clockwork

echo building target
./clockwork/scripts/build-all.sh clockwork/

