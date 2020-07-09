# as user postgres
USER=`whoami`
if [ "${USER}" != "postgres" ]; then
    echo "not postgres!! su - postgres "
    exit 1
fi


psql <<-EOF
  create user pgb with superuser login password 'pgb1234' ;
  \q
EOF

[ ! -f /etc/pgbouncer/pgbouncer.ini.org ] $$ cp /etc/pgbouncer/pgbouncer.ini /etc/pgbouncer/pgbouncer.ini.org

#@=====[pgbouncer /etc/pgbouncer/pgbouncer.ini ]

cat <<EOF > /etc/pgbouncer/pgbouncer.ini
;
; pgbouncer configuration example
[databases]
;* = host=localhost
newdb = dbname=newdb host=localhost port=5432
[pgbouncer]
listen_port = 6432
listen_addr = *
admin_users = pgb
auth_type = md5

; Place it in secure location
auth_file = /etc/pgbouncer/userlist.txt
logfile = /var/log/pgbouncer/pgbouncer.log
pidfile = /var/run/pgbouncer/pgbouncer.pid
; default values
pool_mode = session
default_pool_size = 80
ignore_startup_parameters = extra_float_digits
EOF

#@=====[pgbouncer userlist.txt]
# first dump the info into a temp file
psql -c "select rolname,rolpassword from pg_authid;" > /tmp/users.tmp
touch /etc/pgbouncer/userlist.txt
# then go through the file to remove/add the entry in pool_passwd file
cat /tmp/users.tmp | awk 'BEGIN {FS="|"}{print $1" "$2}' | grep md5 | while read f1 f2
do
 echo "setting passwd of $f1 in /etc/pgbouncer/userlist.txt"
 # delete the line if exits
 sed -i -e "/^\"${f1}\"/d" /etc/pgbouncer/userlist.txt
 echo "\"$f1\"" "\"$f2\"" >> /etc/pgbouncer/userlist.txt
done

rm /tmp/users.tmp


