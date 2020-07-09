# as user root 
#@=====[ postgres work script copy ]

mkdir -p /home/postgres/work

\cp ./*.p.sh /home/postgres/work/.

chown -R postgres:postgres /home/postgres/work
