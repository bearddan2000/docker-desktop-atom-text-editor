FROM ubuntu:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      wget git \
  && wget --no-check-certificate https://atom.io/download/deb -O atom.deb \
  && apt-get -f install ./atom.deb \
  && useradd -d /home/developer -m developer -s /bin/bash

USER developer

CMD ["/usr/bin/atom","-f","--no-sandbox"]
