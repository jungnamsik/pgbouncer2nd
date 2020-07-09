# as postgres
#@=====[postgres ssh 설정]

USER=`whoami`

if [ "${USER}" != "postgres" ]; then
    echo "not postgres!! su - postgres "
    exit 1
fi

#each host~~
ssh-keygen -t rsa
ssh-copy-id postgres@pg01
ssh-copy-id postgres@pg02
ssh-copy-id postgres@pg03
# ---------------------------------
# ssh-copy-id postgres@pg01.localnet
# ssh-copy-id postgres@pg02.localnet
# ssh-copy-id postgres@pg03.localnet
