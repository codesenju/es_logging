#!/bin/bash
uid=$1
gid=$2

if [ "$1" != "" ] && [ "$2" != "" ]; then
    echo "Positional parameter 1 & 2 contains value"
    echo "uid=$1 gid=$2"
    
    docker run --rm --volumes-from es01 \
    -v $(pwd):/backup <registry>/mini-lab/centos7:dev bash \
    -c "cd /usr/share/elasticsearch && tar cvf /backup/elastic.backup.tar.gz data"

    sleep 2

    docker run --rm -ti \
    -v $(pwd):/backup <registry>/mini-lab/centos7:dev chown $uid:$gid /backup/elastic.backup.tar.gz

else
    echo "Positional parameter 1 & 2 is empty"
fi

