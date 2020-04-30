# ----------------------------------------
#
# The primary intention of this image is to inherit
# uoa-inzight-base image and install Lite specific 
# packages
#
# ----------------------------------------
FROM scienceis/uoa-inzight-lite-base:shengwei20181220

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

ENV BUILD_DATE "2015-12-03"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN apt-get install -y -q \
    vim\
  && R -e "devtools::install_github('iNZightVIT/iNZightMaps', dependencies = T)" \
  && rm -rf /tmp/* /var/tmp/*

