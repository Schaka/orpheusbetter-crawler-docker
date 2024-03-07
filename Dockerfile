# syntax=docker/dockerfile:1
FROM python:3.8-alpine3.18

WORKDIR /
ENV HOME=/config

RUN apk update && \
    apk add git mktorrent flac lame sox && \
    git clone https://github.com/Schaka/orpheusbetter-crawler-docker

WORKDIR /orpheusbetter-crawler-docker
COPY . /app
WORKDIR /app
RUN rm -r /orpheusbetter-crawler-docker


ENV PATH="$PATH:/root/.local/bin"
RUN pip install -r requirements.txt

ENTRYPOINT ["/bin/sh", "-c"]
