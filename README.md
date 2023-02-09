# :rotating_light: :detective: Security Information 

When operating a validator it's important to protect certain keypairs.
Validator identity keypairs are considered none secure as potentially datacenter admins and cloud service providers may have access to view these files. Therefore when creating authority accounts, this should be made from a secure device, 
seperate to that of the validator instance.

Read more about authorized accounts on Solana's offical Documentation.

https://docs.solana.com/running-validator/validator-start#create-authorized-withdrawer-account

# :closed_lock_with_key: :computer:  create worker account on secure laptop

The following command should be done on a secure laptop. 
Your solana config keypair will be the secure authrority account and requires small amount of SOL to create the clockwork account.

`~/signatory.json` will be your validator identity and clockwork signer...requires small amount of SOL to process transactions.
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/create_account.sh)
```
```
source export_path.sh;
```
```
solana-keygen new -o ~/signatory.json;
```
```
clockwork worker create ~/signatory.json;
```
```
solana transfer ~/signatory.json 0.5 --allow-unfunded-recipient
```



# :door: :gear: clockwork init on validator
 The following command should be done on the Validator instance. (Not the secure laptop)
 
 It's design to run on an empty server / fresh install.
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/clockwork_init.sh);
```
```
source export_path.sh
```
```
solana-keygen recover
```
```
sudo systemctl enable --now sol
```
```
sudo systemctl status --now sol
```


# :bookmark_tabs: :mag: Monitoring Solution (Optional)
 The following command will route `/var/log/solana/solana_validator.log` + server metrics to a grafana dashboard
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/clockwork_log.sh);
```

# :door: :gear: Stop and Reset Validator with updated Versions
 The following command should be done on the Validator instance. (Not the secure laptop)

```
sudo systemctl stop sol
```

```
sh -c "$(curl -sSfL https://release.solana.com/v1.14.3/install)"
```

```
cp clockwork/lib/clockwork-worker-keypair.json ~/
cp clockwork/lib/geyser-plugin-config.json ~/
```

```
cd clockwork ; git pull; git checkout v1.4.3 
```

```
cd clockwork ; git pull; git checkout v1.4.3 
```
```
./scripts/build-all.sh .
export PATH=$PWD/bin:$PATH
cp ~/clockwork-worker-keypair.json ~/clockwork/lib/
cp ~/geyser-plugin-config.json ~/clockwork/lib/ 
```
```
sudo systemctl start sol
```

```
tail -f /var/log/solana/solana_validator.log
```

