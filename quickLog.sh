sed -i "s|logs_enabled: false|logs_enabled: true|g" /etc/datadog-agent/datadog.yaml
mkdir /etc/datadog-agent/conf.d/clockwork_rpc.d
cd /etc/datadog-agent/conf.d/clockwork_rpc.d
wget https://raw.githubusercontent.com/redazul/clockwork_init/main/conf.yaml

