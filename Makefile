DATE := $(shell date +"%Y-%m-%d")
REPOSITORY=example.com
MUSIC_DIR=/mnt/music
PLAYLIST_DIR=/mnt/playlists

all:
        make build && make push

build:
        make build-alpine && make tag

build-alpine:
        docker build --pull -t neurove/mopidy:$(DATE) . 

tag:
        docker tag neurove/mopidy:$(DATE) neurove/mopidy:latest
        docker tag neurove/mopidy:$(DATE) $(REPOSITORY):5000/neurove/mopidy:latest

up:
        docker-compose mopidy up

down:
        docker-compose mopidy down

run-fg:
        docker run --name mopidy --device /dev/snd -p 6600:6600 -p 6680:6680 -v $(MUSIC_DIR):/music -v $(PLAYLIST_DIR):/m3u  --rm -it neurove/mopidy:latest

run-bg:
        docker run --name mopidy --device /dev/snd -p 6600:6600 -p 6680:6680 -v $(MUSIC_DIR):/music -v $(PLAYLIST_DIR):/m3u --restart=unless-stopped -d neurove/mopidy:latest

push:
        docker push $(REPOSITORY):5000/neurove/mopidy:latest
