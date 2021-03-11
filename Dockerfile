# ----------------------------------------
#
# The primary intention of this image is to inherit
# uoa-inzight-base image and install Lite specific 
# packages
#
# ----------------------------------------
FROM scienceis/uoa-inzight-lite-base:dev

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

ENV BUILD_DATE "2020-10-01"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN R -e "install.packages(c('openssl', 'wkb'))" \
  && rm -rf /tmp/* /var/tmp/*
#R -e "install.packages('https://r.docker.stat.auckland.ac.nz/src/contrib/iNZightPlots_2.12.6.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)" \
