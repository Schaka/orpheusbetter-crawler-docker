# syntax=docker/dockerfile:1
FROM python:3.8-alpine3.18

WORKDIR /

RUN addgroup -g 1000 orpheus && adduser -u 1000 -D -G orpheus -h /config orpheus && \
    apk update && \
    apk add git mktorrent flac lame sox && \
    git clone https://github.com/Schaka/orpheusbetter-crawler-docker

WORKDIR /orpheusbetter-crawler-docker
COPY . /app
WORKDIR /app
RUN rm -r /orpheusbetter-crawler-docker && \
    chown -R orpheus:orpheus /app


ENV PATH="$PATH:/root/.local/bin"
RUN pip install -r requirements.txt
USER orpheus

ENTRYPOINT ["/bin/sh", "-c"]
