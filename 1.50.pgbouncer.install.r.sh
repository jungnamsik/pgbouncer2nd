# as user root
#@=====[pgbouncer 설치]
PGDBVER=12

# yum install pgbouncer

yum -y install pgbouncer pgbconsole

#@=====[pgbouncer 서비스 등록]
# as user root
mkdir /etc/systemd/system/pgbouncer.service.d
cat <<EOF > /etc/systemd/system/pgbouncer.service.d/override.conf
[Service]
User=postgres
Group=postgres
EOF

#@=====[pgbouncer 소유권 변경]
sudo chown postgres:postgres -R /etc/pgbouncer

#@=====[pgbouncer pid, socket ]
sudo mkdir /var/run/pgbouncer
sudo chown -R postgres:postgres /var/run/pgbouncer

sudo chown -R postgres:postgres /var/log/pgbouncer
