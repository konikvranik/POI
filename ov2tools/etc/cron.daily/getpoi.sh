#!/bin/sh

cd /home/public
/usr/local/bin/getpoi.sh 2> /var/log/getpoi.err > /var/log/getpoi.out

[ -e /tmp/ov2_todevice ] && rm -rf /tmp/ov2_todevice
mkdir -p /tmp/ov2_todevice
cd /tmp/ov2_todevice
unzip /home/public/ov2.zip
md5sum /home/public/POI/data/*.ov2 | sed 's#/home/public/POI/data/##' | LINGUAS=en LANG=en LC_ALL=en LANGUAGE=en md5sum -c | sed -n 's/: OK$//p' | while read i; do
	rm "$i"
done
mv *.ov2 /home/public/POI/data/
rm -rf /home/public/POI/todevice/*
/usr/local/bin/ttn2device /home/public/POI/data/ /home/public/POI/todevice
zip /home/public/POI/todevice.zip /home/public/POI/todevice/*
tar cvfz /home/public/POI/todevice.tgz /home/public/POI/todevice/*

[ -e /tmp/getpoi ] && rm -rf /tmp/getpoi
mkdir -p /tmp/getpoi
cd /tmp/getpoi
unzip /home/public/CSV.zip
/usr/local/bin/loadPOIs
rm -rf /tmp/getpoi
export PGUSER=postgres
/usr/bin/vacuumdb --analyze --full --all
/usr/bin/psql -c 'SELECT COUNT(*) FROM poi;' POI

