#@=====[ cluster 상태 확인 ]

# cluster status
repmgr -f /etc/repmgr/12/repmgr.conf cluster show

repmgr -f /etc/repmgr/12/repmgr.conf cluster show --compact


#@=====[ replication/wal_receiver 상태 확인 ]
# pg01 is the primary
psql -h pg01.localnet -p 5432 -U repmgr -c "select * from pg_stat_replication;"
psql -h pg02.localnet -p 5432 -U repmgr -c "select * from pg_stat_wal_receiver;"
psql -h pg03.localnet -p 5432 -U repmgr -c "select * from pg_stat_wal_receiver;"



