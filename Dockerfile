FROM ubuntu:14.04

LABEL authors="Nathan S. Watson-Haigh <nathan.watson-haigh@adelaide.edu.au>"

ENV SEQTOOLS_VERSION 4.44.1
ENV ZMAP_VERSION 2.11.6

# Install dependencies
RUN apt-get update && apt-get install -y \
  --no-install-recommends \
  build-essential \
  curl \
  libcurl4-gnutls-dev \
  libgtk2.0-dev \
  libglib2.0-dev \
  libreadline6-dev \
  libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN curl ftp://ftp.sanger.ac.uk/pub/resources/software/seqtools/PRODUCTION/seqtools-${SEQTOOLS_VERSION}.tar.gz | tar -xz
RUN curl ftp://ftp.sanger.ac.uk/pub/resources/software/zmap/production/zmap-${ZMAP_VERSION}.tar.gz | tar -xz

WORKDIR /opt/seqtools-${SEQTOOLS_VERSION}
RUN ./configure && make && make install
RUN ln -s /opt/seqtools-${SEQTOOLS_VERSION} /opt/seqtools

WORKDIR /opt/zmap-${ZMAP_VERSION}
RUN ./configure && make && make install
RUN ln -s /opt/zmap-${SEQTOOLS_VERSION} /opt/zmap

WORKDIR /opt
