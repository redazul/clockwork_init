#!/bin/bash

#purge old files
rm clockwork -rf
rm export_path.sh
rm validator.sh

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

echo "[6] building clockwork"
./clockwork/scripts/build-all.sh clockwork/

echo "[7] getting update worker script"
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/update_id.py -O $HOME/clockwork/lib/update_id.py

echo "[8] get validator script"
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/validator.sh

echo "[9] update worker config"
python3 $HOME/clockwork/lib/update_id.py  $HOME/.config/solana/id.json 3 $HOME

echo -e "\e[1;31m[WARNING do not! provide your clockwork Authority seed phrase...use Signatory seed phrase instead]"
echo -e"\033[0;32mEXAMPLE key to give"
echo "Address: Hm8tCDvPCRCTvjufgWYSxJJB73ar6dugPU1e1b2HBwJB"
echo  "Fees: 0"
echo  "Penalty: 0"
echo  "Worker {"
echo -e "\033[0;33mauthority: 2GrqFsGVx41fqNVkPfFYCbXXMavQ2XBfrvghFJfAoNbp, <---- DO NOT GIVE THIS ONE"
echo    "commission_balance: 0,"
echo    "commission_rate: 0,"
echo    "id: 3,"
echo -e "\033[0;33msignatory: GSwvcrXmVnXmidiRmeEQcB3Fe82ETxqxt9FNh3ENZJt6, <----- GIVE THIS ONE"
echo -e "\033[0;32mtotal_delegations: 0,"
echo    "}"
echo -e "[10] provide your clockwork Signatory seed phrase"

echo -e "\033[0;33m[This will replace your current Keypair located @ $HOME/.config/solana/id.json " 
echo "ctrl+c to cancel signatory assignment"
echo -e "\033[0;32m"
solana-keygen recover --force







