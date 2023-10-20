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
```