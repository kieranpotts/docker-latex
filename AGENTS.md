# LaTeX Docker image

This repository builds a Docker image for running LaTeX compilations
(`pdflatex`). The image is Debian slim (`debian:bookworm-slim`) with a
minimal set of TeX Live packages installed. It's consumed by other projects
such as [resume](https://github.com/kieranpotts/resume) that compile PDFs
from LaTeX source.

The capitalized words REQUIRED, MUST, MUST NOT, RECOMMENDED, SHOULD,
SHOULD NOT, OPTIONAL, and MAY are to be interpreted as described in
[IETF RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

## Tech stack

- Docker (`debian:bookworm-slim` base image, TeX Live).
- Make, wrapping thin Bash scripts under `run/`.

## Project structure

- **[src/Dockerfile](./src/Dockerfile)** \
  The image definition. Installs `texlive-base`, `texlive-latex-base`,
  `texlive-latex-extra`, `texlive-fonts-recommended`, and
  `texlive-fonts-extra`. Working directory and volume mount point is `/data`.

- **[run/build](./run/build)** \
  Builds the image from `src/Dockerfile`.

- **[run/publish](./run/publish)** \
  Tags and pushes the built image to Docker Hub (`kieranpotts/latex`), then
  logs out.

## Tools

- `make build` \
  Builds the image locally.

- `make publish` \
  Publishes the built image to Docker Hub. Requires `DOCKER_USERNAME` and
  `DOCKER_TOKEN` to be set, and the HEAD commit to be tagged with the release
  version being published.

## Rules

- MUST tag the HEAD commit with the semantic version before running
  `make publish`, so the published image tag matches the Git tag.

- MUST NOT commit a Docker Hub access token. Treat it like a password.
  Regenerate immediately via Docker Hub account settings if one leaks.

## References

This project follows Kieran Potts' technical standards. Read the relevant
standard(s) below for the current task. Their RFC 2119 rules MUST be followed
unless explicitly overridden elsewhere in this file.

- **[TS-9: Version Control](https://kieranpotts.com/standards/009)**
- **[TS-58: Docker](https://kieranpotts.com/standards/058)**
