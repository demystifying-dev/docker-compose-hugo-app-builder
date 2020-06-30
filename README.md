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

- [clone this GitHub repo](https://github.com/demystifying-dev/docker-compose-hugo-app-builder.git), or
- (or as an alternative, download interactively [from this link](https://github.com/demystifying-dev/docker-compose-hugo-app-builder/archive/master.zip)) 
  and unpack into any workspace folder reserved for Hugo projects
  ```bash
  git clone git@github.com:demystifying-dev/docker-compose-hugo-app-builder.git
  cd docker-compose-hugo-app-builder
  ```

## Create one or more Hugo app instances

- Specify the site name in the `.env` file
  ```bash
  cat .env
  SITE=hugodockerftw
  ```
- Scaffold the code for your Hugo app
  ```bash
  ./create.sh 
  hugodockerftw
  Creating network "docker-compose-hugo-app-builder_default" with the default driver
  Creating hugodockerftw ... done
  Attaching to hugodockerftw
  hugodockerftw | Congratulations! Your new Hugo site is created in /src/hugodockerftw.
  hugodockerftw | 
  hugodockerftw | Just a few more steps and you're ready to go:
  hugodockerftw | 
  hugodockerftw | 1. Download a theme into the same-named folder.
  hugodockerftw |    Choose a theme from https://themes.gohugo.io/ or
  hugodockerftw |    create your own with the "hugo new theme <THEMENAME>" command.
  hugodockerftw | 2. Perhaps you want to add some content. You can add single files
  hugodockerftw |    with "hugo new <SECTIONNAME>/<FILENAME>.<FORMAT>".
  hugodockerftw | 3. Start the built-in live server via "hugo server".
  hugodockerftw | 
  hugodockerftw | Visit https://gohugo.io/ for quickstart guide and full documentation.
  hugodockerftw exited with code 0
  Removing hugodockerftw ... done
  Removing network docker-compose-hugo-app-builder_default
  ```

- Note that it runs, asks you for sudo privileges, 
  then cleans up, according to .env and docker-compose file,
  and we are left simply with the scaffolded source files
  ```bash
  docker-compose -f docker-compose.create.yml ps
  Name   Command   State   Ports
  ------------------------------
  tree -a hugodockerftw
  hugodockerftw/
  ├── archetypes
  │   └── default.md
  ├── config.toml
  ├── content
  ├── data
  ├── docker-compose.yml
  ├── .env
  ├── .gitignore
  ├── layouts
  ├── static
  └── themes
  ```

## Enter the app instance folder and docker up

- Run

  ```
  cd hugodockerftw
  docker-compose up
  mkdir layouts/_default
  echo "Hello brave world!" > layouts/_default/list.html
  Starting hugodockerftw ... done
Attaching to hugodockerftw
hugodockerftw | Building sites … 
hugodockerftw |                    | EN  
hugodockerftw | -------------------+-----
hugodockerftw |   Pages            |  6  
hugodockerftw |   Paginator pages  |  0  
hugodockerftw |   Non-page files   |  0  
hugodockerftw |   Static files     |  0  
hugodockerftw |   Processed images |  0  
hugodockerftw |   Aliases          |  0  
hugodockerftw |   Sitemaps         |  1  
hugodockerftw |   Cleaned          |  0  
hugodockerftw | 
hugodockerftw | Built in 1 ms
hugodockerftw | Watching for changes in /src/{archetypes,content,data,layouts,static}
hugodockerftw | Watching for config changes in /src/config.toml
hugodockerftw | Environment: "DEV"
hugodockerftw | Serving pages from memory
hugodockerftw | Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
hugodockerftw | Web Server is available at http://localhost:1313/ (bind address 0.0.0.0)
hugodockerftw | Press Ctrl+C to stop

  ```

- Point your browser at http://localhost:1313
- Make some changes in any IDE or text editor
  ```bash
  code .
  ```
- Indeed, go forth and create 1,2 many Hugo apps!
- Ctrl-C when finished to bring the container down
- If you wish to clean up to the last possible vestige, do 
  ```bash
  docker-compose down -v --rmi all --remove-orphans
  ```
- In any case, you are still left with the code you have developed

## Thanks!

- To [Hugo SSG](https://gohugo.io/)
- To [Docker Compose](https://docs.docker.com/compose/)
- To the fantastic [Hugo Docker image always kept up to date and offering so many alternatives],
  only two of which we're using here, but we will be using more

