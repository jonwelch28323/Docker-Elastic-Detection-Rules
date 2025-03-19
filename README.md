# Docker Elastic Detection Rules

'''bash
git pull https://github.com/elastic/detection-rules.git
'''

This is just the Elastic Detection Rules Python library in a docker container.

Build the docker container:
```bash
docker build . -t elastic-rules:latest 
```

Start the docker container
```bash
docker compose -f .\docker-compose.yml up -d
```

