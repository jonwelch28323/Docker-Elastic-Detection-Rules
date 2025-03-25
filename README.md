# Docker Elastic Detection Rules

'''bash
git pull https://github.com/elastic/detection-rules.git
'''
Copy the .env.example to .env and update the settings.
```bash
cp .env.example .env
```
Update the settings for your Kibana host, user, password and SSL setting.

```bash
KIBANA_URL=changeme
KIBANA_USER=elastic
KIBANA_PASSWORD=changeme
IGNORE_SSL_ERRORS=true
```

You could choose to run the start.sh script which will execute the below actions or you may choose to do it manualy.

This is just the Elastic Detection Rules Python library in a docker container.

Build the docker container:
```bash
docker build . -t elastic-rules:latest 
```

Start the docker container
```bash
docker compose -f .\docker-compose.yml up -d
```

