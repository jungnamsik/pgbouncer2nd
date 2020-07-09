# as user root 
#@=====[ postgres work script copy ]

mkdir -p /home/postgres/work

\mv ./*.p.sh /home/postgres/work/.

chown -R postgres:postgres /home/postgres/work
