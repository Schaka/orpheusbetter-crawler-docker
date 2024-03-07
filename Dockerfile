# syntax=docker/dockerfile:1
FROM python:3.8.18-alpine3.19

WORKDIR /

RUN groupadd -g 1000 orpheus && useradd -u 1000 -g orpheus -d /config orpheus && \
    apt-get update && \
    apt-get install -y --no-install-recommends git mktorrent flac lame sox && \
    git clone https://github.com/Schaka/orpheusbetter-crawler-docker

RUN apk update
RUN apk add py3-pip mktorrent flac lame sox

COPY . /app
WORKDIR /app
RUN rm .git .gitignore -fR
RUN pip3 install --user -r requirements.txt && \
    chown -R orpheus:orpheus ./

ENTRYPOINT ["/bin/bash"]
