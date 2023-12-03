ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk --update add \
        postgresql15 \
        postgresql15-client \
        tini \
        util-linux-login \
    && mkdir -p /run/postgresql \
    && chown postgres:postgres /run/postgresql

COPY templates /templates

COPY entrypoint* /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint*
ENTRYPOINT "/usr/local/bin/entrypoint.sh"
CMD []
