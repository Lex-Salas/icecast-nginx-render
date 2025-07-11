FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y icecast2 && \
    apt clean

COPY icecast/icecast.xml /etc/icecast2/icecast.xml

EXPOSE 8000

CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
