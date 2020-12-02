# -------------------------------------------------------
# The primary intention of this image is to inherit
# uoa-inzight-base image and install Lite specific
# packages
# --------------------------------------------------------

FROM scienceis/uoa-inzight-base

LABEL maintainer="inzightlite_support@stat.auckland.ac.nz"
LABEL nz.inzight="iNZight"

# Edit the following environment variable, commit to Github and it will trigger Docker build
# Since we fetch the latest changes from the associated Application~s master branch
# this helps trigger date based build
# The other option would be to tag git builds and refer to the latest tag
ENV LAST_BUILD_DATE "Wed 03 12 21:45:00 NZDT 2020"
