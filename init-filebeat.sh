#!/usr/bin/sh

rm -rf /appli/filebeat

mkdir /appli
mkdir /appli/filebeat
mkdir /appli/filebeat/output
mkdir /appli/filebeat/registry
mkdir /appli/filebeat/logs

cp -r /mnt/d/Perso/elastic-sandbox/filebeat/* /appli/filebeat
chown -R root:root /appli/filebeat
