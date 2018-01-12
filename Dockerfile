FROM node:latest
COPY pgdq.list /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  apt-key add - \
  && apt-get update
RUN apt-get update \
  && apt-get install -y postgresql-9.6 postgresql-contrib-9.6 \
  && apt-get install sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
