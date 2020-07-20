#!/usr/bin/bash

# Ubuntu 20.04

# edit .env file with Hugo app name

# Thank you https://gist.github.com/judy2k/7656bfe3b322d669ef75364a46327836#gistcomment-3224582
source .env

echo $SITE

docker-compose -f docker-compose.create.yml up

# Cleanup
# Everything
#   docker-compose down -v --rmi all --remove-orphans

# Keep docker image on your system for quick reuse: 
docker-compose -f docker-compose.create.yml down -v --remove-orphans

# Make sure it's ours:
sudo chown -R $USER: $SITE

# Set up dev instance folder
cp docker-compose.up.yml $SITE/docker-compose.yml
cp docker-compose.build.yml $SITE/docker-compose.build.yml
cp .env $SITE/.env
cp .gitignore $SITE/.gitignore
cd $SITE
