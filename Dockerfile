FROM alpine:latest

RUN apk add --update nodejs npm git && \
    npm install -g git-auto-merger


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
