# mopidy-alpine-linux-docker_image

[**Mopidy**](https://www.mopidy.com/) Docker image based on [**Alpine Linux**](https://www.alpinelinux.org/).

## Features:
- Based on Alpine Linux: smaller than a debian or ubuntu based image.
- Runs on Raspberry Pi (tested on Model 4B)
- Uses the latest mopidy version from the python3 pip repository.  
- Customizable: mopidy plugins can be added/removed by editing requirements.txt.  
- Mopidy configuration example using replaygain for volume normalization and ALSA.
- Includes Healtcheck for monitoring

## Build

Build Docker Image:  
 $ make build

Tag docker image with current date:  
 $ make tag

Run docker image in foreground using docker:  
 $ make run-fg

Run docker image in backgroundground using docker:  
 $ make run-bg

Stop the docker image using docker-compose:  
 $ make down

Run the docker image using docker-compose:  
 $ make up

Run the  docker image using docker-compose:  
 $ make down
 
## Frontend
You can access the available frontends at http://localhost:6680. 

## Updating files in mopidy-local
Using docker-compose: 
$ docker-compose exec mopidy mopidy local scan 

Using docker:  
$ docker exec CONTAINER_NAME mopidy local scan

## License
MIT License
