# clockwork init
```
rm clockwork -r;\
remove export_path.sh;\
bash <(curl -s https://raw.githubusercontent.com/redazul/clockwork_init/main/clockwork_init.sh);\
source export_path.sh;\
python3 clockwork/lib/update_id.py  $HOME/.config/solana/id.json 3
```
