# :rotating_light: :detective: Security Information 

When operating a validator it's important to protect certain keypairs.
Validator identity keypairs are considered none secure as potentially datacenter admins and cloud service providers may have access to view these files. Therefore when creating authority accounts, this should be made from a secure device, 
seperate to that of the validator instance.

Read more about authorized accounts on Solana's offical Documentation.

https://docs.solana.com/running-validator/validator-start#create-authorized-withdrawer-account

# :closed_lock_with_key: :computer:  create worker account on secure laptop

The following command should be done on a secure laptop.
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/create_account.sh)
```



# :door: :gear: clockwork init on validator
 The following command should be done on the Validator instance. (Not the secure laptop)
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/clockwork_init.sh);\
source export_path.sh;\
solana-keygen recover;
```

# :bookmark_tabs: :mag: Monitoring Solution (Optional)
 The following command will route `/var/log/solana/solana_validator.log` + server metrics to a grafana dashboard
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/clockwork_log.sh);
```
