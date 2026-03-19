FROM ubuntu:24.04

LABEL maintainer="Kieran Potts <hello@kieranpotts.com>"

ENV DEBIAN_FRONTEND="noninteractive"

# Update the package lists.
RUN apt-get update -q

# Install texlive-full and a couple of other packages commonly used with it,
# eg. for syntax highlighting (Pygments).
#
# https://www.tug.org/texlive/
# http://www.gnuplot.info/
# https://pygments.org/
#
RUN apt-get install -qy \
    texlive-full \
    gnuplot \
    python3-pygments

# Save some space.
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
