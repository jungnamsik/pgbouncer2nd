
#@=====[check : cluster, enable(postgresql, pgpool), firewall ]

# on pg01
repmgr -f /etc/repmgr/${PGVER}/repmgr.conf cluster show


#enable pgbouncer and start on all servers
sudo systemctl enable pgbouncer
ssh postgres@pg02.localnet "sudo systemctl enable postgresql"
ssh postgres@pg03.localnet "sudo systemctl enable postgresql"

sudo systemctl restart pgbouncer
ssh postgres@pg02.localnet "sudo systemctl restart postgresql"
ssh postgres@pg03.localnet "sudo systemctl restart postgresql"


psql -h localhost -p 6432 -U pgb -d pgbouncer 


