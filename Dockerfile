FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
            gstreamer \
            mopidy \
            py-pip \
            alpine-sdk \
            python3-dev\
            dumb-init \
            curl

# Default configuration
RUN pip3 install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt \
    && rm -rf ~/.cache/pip

# Set default environment variables
ENV TZ=Europe/Berlin
ENV HOME=/home/mopidy

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod go+rwx /entrypoint.sh

# Create directories
RUN mkdir -p /config /music /m3u /podcasts  $HOME

# Copy mopidy.conf
COPY mopidy.conf $HOME/.config/mopidy/mopidy.conf

# Set flie permissions 
RUN chown mopidy:audio -R /config /music /m3u /podcasts  $HOME /entrypoint.sh

# Add user mopidy to group audio
RUN addgroup mopidy audio

# Optional: add user mopidy to wheel group to enable sudo
#RUN apk add --no-cache sudo && addgroup mopidy wheel

# Run as user mopidy
USER mopidy

# Basic check,
RUN /usr/bin/dumb-init sh /entrypoint.sh /usr/bin/mopidy --version

VOLUME ["/music", "/m3u","/podcasts","$HOME/.config/mopidy/"]

EXPOSE 6600 6680

#ENTRYPOINT ["/usr/bin/dumb-init", "sh /entrypoint.sh"]
ENTRYPOINT ["/usr/bin/dumb-init"]
CMD ["/usr/bin/mopidy"]

HEALTHCHECK --interval=5s --timeout=2s --retries=20 \
    CMD curl --connect-timeout 5 --silent --show-error --fail http://localhost:6680/ || exit 1
 
