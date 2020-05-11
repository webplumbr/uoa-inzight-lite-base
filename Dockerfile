# -------------------------------------------------------
#
# This image inherits uoa-inzight-lite-base:shengwei20181220 image, 
# updates packages from docker.stat.auckland.ac.nz 
# repository and installs the shiny app for Lite
#
# --------------------------------------------------------

FROM scienceis/uoa-inzight-lite-base:latest

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

# Edit the following environment variable, commit to Github and it will trigger Docker build
# Since we fetch the latest changes from the associated Application~s master branch
# this helps trigger date based build
# The other option would be to tag git builds and refer to the latest tag
ENV LAST_BUILD_DATE "Mon 11 05 21:45:00 NZDT 2020"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/RCurl/RCurl_1.95-4.12.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)" \
 && R -e "install.packages(c('survey', 'haven', 'tibble', 'dplyr', 'forcats', 'tidyr', 'chron', 'lubridate', 'zoo', 'validate', 'testthat', 'covr', 'Rcpp', 'hms', 'R6', 'BH', 'rlang', 'tidyselect', 'cli', 'fansi', 'lifecycle', 'pillar', 'vctrs', 'glue', 'purrr', 'stringi', 'yaml', 'digest', 'withr', 'jsonlite', 'rex', 'DBI', 'prettyunits', 'pkgbuild', 'rstudioapi', 'callr', 'backports', 'processx', 'ps', 'curl', 'mime'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
 && R -e "devtools::install_github('iNZightVIT/iNZightTools', dependencies = F)" \
 && R -e "devtools::install_github('iNZightVIT/iNZightMR', dependencies = F)" \
 && R -e "devtools::install_github('iNZightVIT/iNZightPlots', dependencies = F)" \
 && R -e "devtools::install_github('iNZightVIT/iNZightMaps', dependencies = F)" \
 
 # && R -e "install.packages('https://r.docker.stat.auckland.ac.nz/src/contrib/iNZightTS_1.5.1.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)" \
  && rm -rf /tmp/* /var/tmp/*
