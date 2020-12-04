# -------------------------------------------------------
#
# This image inherits uoa-inzight-lite-base:dev image, 
# updates packages from docker.stat.auckland.ac.nz 
# repository and installs the shiny app for Lite
#
# --------------------------------------------------------

FROM scienceis/uoa-inzight-lite-base:dev

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

# Edit the following environment variable, commit to Github and it will trigger Docker build
# Since we fetch the latest changes from the associated Application~s master branch
# this helps trigger date based build
# The other option would be to tag git builds and refer to the latest tag
ENV LAST_BUILD_DATE "Wed 26 02 21:45:00 NZDT 2020"

#\
#  && rm -rf /tmp/* /var/tmp/*
# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN apt-get update && apt-get install -y locales locales-all 
#ENV LC_ALL en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
&& locale-gen en_US.utf8 \
&& /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
