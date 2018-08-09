FROM debian:stretch

RUN mkdir /app
WORKDIR /app
RUN apt-get update
RUN apt-get install -y wget gnupg2 python3

ARG version=0.16.0

RUN wget -q https://github.com/vector-im/riot-web/releases/download/v${version}/riot-v${version}.tar.gz
RUN wget -q https://github.com/vector-im/riot-web/releases/download/v${version}/riot-v${version}.tar.gz.asc
RUN wget -q https://riot.im/packages/keys/riot.asc
RUN gpg --import riot.asc
RUN gpg riot-v${version}.tar.gz.asc
RUN tar xzf riot-v${version}.tar.gz
WORKDIR /app/riot-v${version}

RUN mkdir /data
RUN mv config.sample.json /data/config.json
RUN ln -s /data/config.json config.json

VOLUME /data
EXPOSE 8000
CMD python3 -m http.server
