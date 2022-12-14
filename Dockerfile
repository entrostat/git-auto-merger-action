FROM alpine:latest

RUN apk add --update nodejs npm git bash && \
    npm install -g git-auto-merger

RUN mkdir /scripts
COPY convert-array-to-args.js /scripts/convert-array-to-args.js

COPY entrypoint.sh /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
