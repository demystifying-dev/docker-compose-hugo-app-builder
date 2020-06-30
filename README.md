# Docker Compose for creation and development of an [Hugo](https://gohugo.io/documentation/) static site generator instance

## Video

[![docker-compose-hugo-app-builder(http://img.youtube.com/vi/i95AMY1lXNo/0.jpg)](https://youtu.be/i95AMY1lXNo)

## Refs

- [Install Docker Compose](https://docs.docker.com/compose/install/) on your development system
- [klakegg/hugo images recommended by Hugo docs](https://hub.docker.com/r/klakegg/hugo/) 
- [Vladislav Supalov's very useful article: Cleaning Up After Docker](https://vsupalov.com/cleaning-up-after-docker/)

## Requirements

- You must have docker-compose [installed and running](https://docs.docker.com/compose/install/) on your development system

## What's the plan

- Use docker compose to scaffold an Hugo app from scratch,
  even without having installed Hugo on your system, and clean up afterwards
- Use another docker compose file to bring up your newly created Hugo App in your favorite IDE
  and develop in a hot reloading environment
- You can install several different apps, using in each case different Hugo releases and types 
  and of course container names!

## Clone or download this repo

- Either 
  - [clone this GitHub repo](https://github.com/demystifying-dev/docker-compose-hugo-app-builder.git), or
  - Download interactively [from this link](https://github.com/demystifying-dev/docker-compose-hugo-app-builder/archive/master.zip) 
    and unpack into a folder where you are planning to work on Hugo projects 

## Create one or more Hugo app instances

- Note that it runs, then cleans up, according to .env and docker-compose file

## Enter any app instance folder and docker up

-
  ```
  docker-compose up
  mkdir layouts/_default
  echo "Hello brave world!" > layouts/_default/list.html
  ```
- Point your browser at localhost:1313

Make some changes and see them load instantly

## Create 1,2 many Hugo apps

## Thanks!

- Hugo
- Docker Compose
- Docker Compose Hugo image always kept up to date and offering so many alternatives,
  only two of which we're using here, but there are very many choices indeed
