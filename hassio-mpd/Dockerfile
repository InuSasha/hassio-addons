ARG BUILD_FROM
FROM $BUILD_FROM

RUN mkdir /data
RUN apk --update add \
        alsa-utils \
        pulseaudio-utils \
        pulsemixer \
        mpc \
        mpd

COPY mpd.conf /etc/mpd.conf
COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT "/usr/bin/entrypoint.sh"
CMD ["--verbose"]
