# -------------------------------------------------------
#
# This image inherits uoa-inzight-lite-base:shengwei20181220 image, 
# updates packages from docker.stat.auckland.ac.nz 
# repository and installs the shiny app for Lite
#
# --------------------------------------------------------

FROM scienceis/uoa-inzight-base:dev

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

# Edit the following environment variable, commit to Github and it will trigger Docker build
# Since we fetch the latest changes from the associated Application~s master branch
# this helps trigger date based build
# The other option would be to tag git builds and refer to the latest tag
ENV LAST_BUILD_DATE "Sun 24 11 21:45:00 NZDT 2019"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN R -e "install.packages('devtools', repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('shinyjs', 'shinycssloaders', 'shinyWidgets', 'GGally', 'gpairs', 'RJSONIO', 'shinyalert'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "devtools::install_github('iNZightVIT/iNZightTools', dependencies = TRUE)" \
  && R -e "devtools::install_github('iNZightVIT/iNZightMR', dependencies = TRUE)" \
  && R -e "devtools::install_github('iNZightVIT/iNZightPlots', dependencies = TRUE)"\
  && R -e "devtools::install_github('iNZightVIT/iNZightTS', dependencies = TRUE)"\
  && R -e "devtools::install_github('iNZightVIT/iNZightRegression', dependencies = TRUE)"\
  && R -e "devtools::install_github('iNZightVIT/iNZightRegression', dependencies = TRUE)"\
  && R -e "devtools::install_github('iNZightVIT/iNZightMultivariate', dependencies = TRUE)"\
  && rm -rf /tmp/* /var/tmp/*
