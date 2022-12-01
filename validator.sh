#!/bin/bash

docker start promtail

pkill sol

sudo $(command -v solana-sys-tuner) --user $(whoami) > sys-tuner.log 2>&1 &

solana-validator \
--geyser-plugin-config /root/clockwork/lib/geyser-plugin-config.json \
--identity /root/validator-keypair.json \
--rpc-port 8899 \
--entrypoint entrypoint.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint4.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint5.mainnet-beta.solana.com:8001 \
--known-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
--known-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ \
--known-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ \
--known-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S \
--limit-ledger-size \
--no-voting \
#   --log /var/log/solana/solana-validator.log &
