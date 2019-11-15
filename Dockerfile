# -------------------------------------------------------
#
# This image inherits uoa-inzight-lite-base:dev image, 
# updates packages from docker.stat.auckland.ac.nz 
# repository and installs the shiny app for Lite
#
# --------------------------------------------------------

FROM scienceis/uoa-inzight-lite-base:play

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

# Edit the following environment variable, commit to Github and it will trigger Docker build
# Since we fetch the latest changes from the associated Application~s master branch
# this helps trigger date based build
# The other option would be to tag git builds and refer to the latest tag
ENV LAST_BUILD_DATE "Sat 2 11 21:45:00 NZDT 2019"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN R -e "install.packages('iNZightTools', repos = 'http://r.docker.stat.auckland.ac.nz/R/')" \

  && rm -rf /tmp/* /var/tmp/*
