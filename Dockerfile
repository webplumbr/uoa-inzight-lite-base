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
ENV LAST_BUILD_DATE "Sun 20 12 21:45:00 NZDT 2018"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 381BA480 \
    && echo "deb http://deb.debian.org/debian stretch main" | sudo tee -a /etc/apt/sources.list \
    && apt-get update -y -q \

    && R -e "install.packages('readxl', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
    && R -e "devtools::install_github('dkahle/ggmap')" \
    && R -e "install.packages('https://r.docker.stat.auckland.ac.nz/src/contrib/iNZightMaps_2.1.1.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)" \
    && R -e "install.packages('https://r.docker.stat.auckland.ac.nz/src/contrib/iNZightPlots_2.7.12.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)" \
    && R -e "install.packages('dplyr', repos = NULL, dependencies = TRUE)" \
    && R -e "install.packages('GGally', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
    
  && rm -rf /tmp/* /var/tmp/*
