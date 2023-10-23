#!/usr/bin/sh

rm -rf /appli/logstash

mkdir /appli
mkdir /appli/logstash
mkdir /appli/logstash/output

cp -r /mnt/d/Perso/elastic-sandbox/logstash/* /appli/logstash
chown -R root:root /appli/logstash
