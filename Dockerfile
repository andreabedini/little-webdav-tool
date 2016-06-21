FROM alpine
MAINTAINER Andrea Bedini <andrea.bedini@curtin.edu.au>

RUN apk --update upgrade && \
    apk add lighttpd lighttpd-mod_auth lighttpd-mod_webdav

RUN mkdir -p /var/run/lighttpd/

COPY entrypoint.sh lighttpd.conf /root/
CMD  /root/entrypoint.sh

ENV PORT 8080
ENV DOCUMENT_ROOT /var/www
ENV DIGEST "test::14d2f8f05e52ae70a58d8e2dd916bbbe"
ENV DIGEST_FILE /root/htdigest

EXPOSE $PORT
VOLUME $DOCUMENT_ROOT

