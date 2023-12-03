#!/bin/sh -e

DATADIR="/data/postgres"
export DATADIR

# prepare storage
mkdir -p "${DATADIR}"
chown -R postgres:postgres ${DATADIR}
chmod 750 ${DATADIR}

# init database
if ! test -e "${DATADIR}/PG_VERSION"; then
    password=$(
        dd if=/dev/urandom bs=32 count=1 2> /dev/null \
        | base64 \
        | tr -d '\n'
    )
    cat - <<EOM
### INIT DATABASE ################################"
# postgres password: ${password}
# (this will never shown again)
##################################################"
EOM
    su postgres \
        -s /bin/sh \
        -c "initdb \
            --pgdata=${DATADIR} \
            --auth-local=trust \
            --auth-host=md5 \
            --username=postgres \
            --pwfile=<(echo -n \"${password}\") \
        "

    cp /templates/pg_hba.conf "${DATADIR}/"
    chown -R postgres:postgres "${DATADIR}/"
fi

# run database
su postgres \
   -s /bin/sh \
   -c "/usr/bin/postgres \
        -D \"${DATADIR}\" \
        -h 0.0.0.0 \
    "
