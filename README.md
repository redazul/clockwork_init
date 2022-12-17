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
source export_path.sh;\
solana-keygen new -o ~/signatory.json;\
clockwork create new ~/signatory.json
```



# :door: :gear: clockwork init on validator
 The following command should be done on the Validator instance. (Not the secure laptop)
 
 `Worker {
    authority: AEhaXYDznt1nC9xyXg8Vchb6CbBn55VGguPQCyH1Nsi6, <- protect keypair
    commission_balance: 0,
    commission_rate: 0,
    id: <#>, <--- When the script asks place your worker ID
    signatory: AowfbpSC5pkBA5TxAZVsT9DCQg6tHzgxtPiS2ToNfEch, <--- validator identity
    total_delegations: 0,
}`
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/clockwork_init.sh);\
source export_path.sh;\
solana-keygen recover; #<signatory.json seed phrase here>
```

# :bookmark_tabs: :mag: Monitoring Solution (Optional)
 The following command will route `/var/log/solana/solana_validator.log` + server metrics to a grafana dashboard
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/clockwork_log.sh);
```
