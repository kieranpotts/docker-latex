# Using Debian slim as the base (150MB). Debian slim includes `apt`, which has
# excellent support for `texlive` packages.
FROM debian:bookworm-slim

LABEL maintainer="Kieran Potts <work@kieranpotts.com>"

ENV DEBIAN_FRONTEND="noninteractive"

# Update package lists.
RUN apt-get update -q

# Installing minimal package set for `pdflatex`:
#
# - texlive-base: Core TeX Live distribution with pdflatex.
# - texlive-latex: LaTeX document class support.
# - texlive-latex-extra: Additional packages - titlesec, enumitem, geometry,
#   hyperref, xcolor, colortbl, etc.
# - texlive-fonts-recommended: Font packages for proper typography.
#
# https://www.tug.org/texlive/
#
RUN apt-get install -qy \
    texlive-base \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended

# Clean up `apt` cache to save space.
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
