# mopidy-alpine-linux-docker_image

[**Mopidy**](https://www.mopidy.com/) Docker image based on [**Alpine Linux**](https://www.alpinelinux.org/).

## Features:
- Based on Alpine Linux: smaller than a debian or ubuntu based image.
- Runs on Raspberry Pi (tested on Model 4B)
- Uses the latest mopidy version from the python3 pip repository.  
- Mopidy plugins can be added/removed by editing requirements.txt.  
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

## License
MIT License
