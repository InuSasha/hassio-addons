ARG BUILD_FROM
FROM $BUILD_FROM

RUN addgroup -g 102 nginx \
    && adduser -G nginx -S -u 102 nginx \
    && apk --update add \
        nginx \
        tini \
        util-linux-login \
    && rm /etc/nginx/http.d/default.conf

COPY http.d/* /etc/nginx/http.d/


COPY entrypoint* /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint*
ENTRYPOINT "/usr/local/bin/entrypoint.sh"
