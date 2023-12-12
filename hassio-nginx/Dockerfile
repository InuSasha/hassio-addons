ARG BUILD_FROM
FROM $BUILD_FROM

RUN addgroup -g 102 nginx \
    && adduser -G nginx -S -u 102 nginx \
    && apk --update add \
        nginx \
        openssl \
        tini \
        util-linux-login \
    && rm /etc/nginx/http.d/default.conf

RUN mkdir /ssl \
    && openssl genrsa -out /ssl/privkey.pem 2048 \
    && openssl req -new -key /ssl/privkey.pem -out /ssl/fullchain.csr -subj "/C=DE/ST=DE/L=Leizig/O=InuSasha/CN=nginx-snakeoil" \
    && openssl x509 -req -days 3650 -in /ssl/fullchain.csr -signkey /ssl/privkey.pem -out /ssl/fullchain.pem \
    && rm /ssl/fullchain.csr

COPY http.d/* /etc/nginx/http.d/

COPY entrypoint* /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint*
ENTRYPOINT "/usr/local/bin/entrypoint.sh"
