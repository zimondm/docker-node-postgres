FROM node:10.12
COPY pgdq.list /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  apt-key add - \
  && apt-get update
RUN apt-get update \
  && apt-get install -y postgresql-9.6 postgresql-contrib-9.6 \
  && apt-get install sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# copy working ph_hba.conf with trust for localhost connection_string
COPY pg_hba.conf /etc/postgresql/9.6/main/pg_hba.conf
# Chrome browser for Headless Testing
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN sudo apt update
RUN sudo apt -y install google-chrome-stable
