# syntax=docker/dockerfile:1
FROM alpine:3.16.2

RUN apk update
RUN apk add python3 py3-pip mktorrent flac lame sox

COPY . /app
WORKDIR /app
RUN rm .git .gitignore -fR
RUN pip3 install --user -r requirements.txt

ENTRYPOINT ["/bin/sh"]
