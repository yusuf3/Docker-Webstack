# Docker Webstack

## About

Forked from https://github.com/eXistenZNL/Docker-Webstack.

[Dockerfile](Dockerfile) & [config](config) which I use for containerized PHP Lumen, based on [Dockerfile-7.4](Dockerfile-7.4) & deploy to GCP Cloud Run.

## How can I use it?

Deploy to GCP Cloud Run:

1. Clone this repo
2. Copy [Dockerfile](Dockerfile) & [config](config) to your folder
3. `gcloud run deploy`

Deploy to local

1. Clone this repo
2. Copy [Dockerfile](Dockerfile) & [config](config) to your folder
3. `docker build -t {your-image-tag} .`
4. `docker run -d -p 8080:8080 --name {your-container-name} {your-image-tag}`
5. or with [docker-compose](docker-compose.yml): `docker-compose up -d`
