FROM postgres:15

COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install --no-install-recommends -y wget unzip make gcc postgresql-server-dev-15 libgd-dev ca-certificates libc6-dev 
RUN wget https://github.com/postgrespro/imgsmlr/archive/master.zip -O /opt/imgsmlr.zip && \
    cd /opt && unzip imgsmlr.zip 
COPY sed_imgsmlr.sh /opt/imgsmlr-master/sed_imgsmlr.sh
RUN cd /opt/imgsmlr-master && sh sed_imgsmlr.sh
RUN cd /opt/imgsmlr-master && make USE_PGXS=1 && make install USE_PGXS=1

RUN wget https://github.com/pgvector/pgvector/archive/master.zip -O /opt/pgvector.zip && \
    cd /opt/ && unzip pgvector.zip
RUN cd /opt/pgvector-master && make && make install

RUN apt-get install -y locales && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"

RUN apt-get remove -y unzip make gcc postgresql-server-dev-15
RUN	rm -rf /var/lib/apt/lists/*
