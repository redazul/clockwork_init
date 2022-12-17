#!/bin/bash

source ~/pre_validator.sh

exec solana-validator --no-poh-speed-test\
                      --no-os-network-stats-reporting\
                      --no-os-memory-stats-reporting\
                      --no-os-cpu-stats-reporting\
                      --log /var/log/solana/solana_validator.log\
                      --identity $HOME/.config/solana/id.json\
                      --rpc-port 8899\
                      --only-known-rpc\
                      --full-rpc-api\
                      --known-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2\
                      --known-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ\
                      --known-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ\
                      --known-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S\
                      --private-rpc\
                      --entrypoint entrypoint.mainnet-beta.solana.com:8001 \
                      --entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
                      --entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
                      --entrypoint entrypoint4.mainnet-beta.solana.com:8001 \
                      --entrypoint entrypoint5.mainnet-beta.solana.com:8001 \
                      --expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d \
                      --wal-recovery-mode skip_any_corrupted_record \
                      --limit-ledger-size \
                      --geyser-plugin-config $HOME/clockwork/lib/geyser-plugin-config.json

# save
# --no-poh-speed-test --no-os-network-stats-reporting --no-os-memory-stats-reporting --no-os-cpu-stats-reporting
