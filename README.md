# Security Information 

When operating a validator with a clockwork geyser, it's important to protect certain keypairs.
Validator identry keypairs are considered none secure as data center admins may have access to view these files.
Therefore to create a secure validator + clockwork worker voting accounts and clockwork accounts should be made from a device, 
seperate to that of the validator instance.

# create worker account

:computer: The following command should be done on a secured laptop.


# clockwork init
:gear: The following command should be done on the Validator instance. (Not the secure laptop)
```
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/clockwork_init.sh); source export_path.sh;
```
