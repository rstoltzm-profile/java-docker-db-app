# java-db-app

## init
```
mvn archetype:generate -DgroupId=com.example -DartifactId=my-java-db-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

# up or down DB
```
docker-compose -f docker-compose.db.yaml up -d
docker-compose -f docker-compose.db.yaml down
```

# up or down APP
```
docker-compose -f docker-compose.app.yaml build
docker-compose -f docker-compose.app.yaml up -d
docker-compose -f docker-compose.app.yaml down
```