FROM alpine:latest

RUN apk add --update nodejs npm git bash && \
    npm install -g git-auto-merger

RUN mkdir /scripts
COPY convert-array-to-args.js /scripts/convert-array-to-args.js

RUN git config --global user.email "git-auto-merger@git-auto-merger.com" && \
    git config --global user.name "git-auto-merger"

COPY entrypoint.sh /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
