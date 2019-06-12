# -------------------------------------------------------
#
# This image inherits uoa-inzight-lite-base:shengwei20181220 image, 
# updates packages from docker.stat.auckland.ac.nz 
# repository and installs the shiny app for Lite
#
# --------------------------------------------------------

FROM scienceis/uoa-inzight-lite-base:shengwei20181220

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

# Edit the following environment variable, commit to Github and it will trigger Docker build
# Since we fetch the latest changes from the associated Application~s master branch
# this helps trigger date based build
# The other option would be to tag git builds and refer to the latest tag
ENV LAST_BUILD_DATE "Wed 12 06 21:45:00 NZDT 2019"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 381BA480 \
    && apt-get update -y -q \

  && R -e "install.packages('readr', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('haven', 'chron', 'lubridate', 'validate'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages('iNZightTools', repos = 'http://r.docker.stat.auckland.ac.nz/R/')" \
    
  && rm -rf /tmp/* /var/tmp/*
