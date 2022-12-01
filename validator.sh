#!/bin/bash

docker start promtail

pkill sol

sudo $(command -v solana-sys-tuner) --user $(whoami) > sys-tuner.log 2>&1 &

solana-validator \
--geyser-plugin-config /root/clockwork/lib/geyser-plugin-config.json \
--identity /root/validator-keypair.json \
--rpc-port 8899 \
--known-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
--known-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ \
--known-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ \
--known-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S \
--no-poh-speed-test \
--no-port-check \
--full-rpc-api \
--only-known-rpc \
--limit-ledger-size \
--no-voting \
--wal-recovery-mode skip_any_corrupted_record \
--log /var/log/solana/solana-validator.log &
