# Elastic-sandbox
Projet Sandbox pour test des outils de la suite elastic


## Filebeat

### Lancement via image Docker

Les fichiers de conf filebeat sont à mettre dans l'arborescence `/appli/filebeat`
Un script d'init de l'arborescence est dispo : `init-filebeat.sh`

Commande Docker :

```sh
# Pull de l'image
docker pull elastic/filebeat:8.10.3

######
# Start de l'image + montage sur les fichier de l'arbo /appli/filebeat
######

# avec un output filebeat vers un fichier 
docker run -d \
  --name=filebeat-local \
  --user=root \
  --volume="/appli/filebeat/filebeat-file.yml:/usr/share/filebeat/filebeat.yml:ro" \
  --volume="/appli/filebeat/logs:/usr/share/filebeat/logs" \
  --volume="/appli/filebeat:/appli/filebeat" \
  elastic/filebeat:8.10.3 filebeat
  
# avec un output filebeat vers la console
docker run -d \
  --name=filebeat-local \
  --user=root \
  --volume="/appli/filebeat/filebeat-console.yml:/usr/share/filebeat/filebeat.yml:ro" \
  --volume="/appli/filebeat/logs:/usr/share/filebeat/logs" \
  --volume="/appli/filebeat:/appli/filebeat" \
  elastic/filebeat:8.10.3 filebeat

# avec un output filebeat vers un logstash local
docker run -d \
  --name=filebeat-local \
  --user=root --network="host" \
  --volume="/appli/filebeat/filebeat-logstash.yml:/usr/share/filebeat/filebeat.yml:ro" \
  --volume="/appli/filebeat/logs:/usr/share/filebeat/logs" \
  --volume="/appli/filebeat:/appli/filebeat" \
  elastic/filebeat:8.10.3 filebeat  
```



## Logstash

### Lancement via image Docker

Les fichiers de conf filebeat sont à mettre dans l'arborescence `/appli/logstash`
Un script d'init de l'arborescence est dispo : `init-logstash.sh`

Commande Docker :

```sh
# Pull de l'image
docker pull elastic/logstash:8.10.4

# Start de l'image + montage sur les fichier de l'arbo /appli/logstash
docker run -d \
  --name=logstash-local \
  --user=root --network="host" \
  --volume="/appli/logstash/pipelines.yml:/usr/share/logstash/config/pipelines.yml:ro" \
  --volume="/appli/logstash/logstash.yml:/usr/share/logstash/config/logstash.yml:ro" \
  --volume="/appli/logstash/pipeline/:/appli/logstash/pipeline" \
  --volume="/appli/logstash/output/:/appli/logstash/output" \
  elastic/logstash:8.10.4
  
# Connexion sur le pod
docker exec --user root -it {{container_id}} /bin/sh  
```