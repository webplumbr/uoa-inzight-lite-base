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
RUN apt-get update \
    && apt-get install -y -q \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev\ 
    libnode-dev\
  && R -e "install.packages(c('Cairo', 'DAAG', 'IRdisplay', 'KFAS', 'MSwM', 'NHANES', 'PBSmapping',  'R.methodsS3'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('R.oo', 'R.utils', 'ROCR', 'RPostgreSQL', 'RPostgres', 'RSQLite', 'RSpectra', 'RcppArmadillo'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('TTR', 'V8', 'bindr', 'bindrcpp', 'bit', 'bit64', 'blob', 'changepoint'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('dbplyr', 'debugme', 'deldir', 'dendextend', 'dlm', 'fBasics', 'fGarch', 'fastICA'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('fontBitstreamVera', 'fontLiberation', 'fontquiver', 'foreach', 'forecast', 'formatR', 'fracdiff', 'gdalUtils'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('gdata', 'gdtools', 'ggplot2movies', 'goftest', 'gplots', 'gss', 'gtools', 'iterators'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('kernlab', 'latticeExtra', 'leaflet', 'lfda', 'listviewer', 'loa', 'mapdata', 'mapview'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('microbenchmark', 'odbc', 'plotlyGeoAssets', 'polyclip', 'pool', 'proto', 'quadprog', 'quantmod'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('rARPACK', 'raster', 'rasterVis', 'repr', 'rgdal', 'satellite', 'scagnostics'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('shinytest', 'showimage', 'spData', 'spatstat', 'spatstat.data', 'spatstat.utils', 'stabledist', 'stars'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('stringdist', 'strucchange', 'svglite', 'tensor', 'testit', 'timeDate', 'timeSeries', 'tmap'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('tmaptools', 'tseries', 'urca', 'vars', 'vdiffr', 'webdriver', 'webshot', 'xlsx'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && R -e "install.packages(c('xlsxjars', 'xts', 'zeallot', 'caTools'), repos = 'https://cran.r-project.org', type = 'source', dependencies = TRUE)" \
  && rm -rf /tmp/* /var/tmp/*
