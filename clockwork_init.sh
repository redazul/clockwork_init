#!/bin/bash

rm -rf clockwork
echo "configuring new clockwork worker"
git clone https://github.com/clockwork-xyz/clockwork
./clockwork/scripts/build-all.sh clockwork/

