# LaTeX Docker image

This repository builds a Docker container image for running LaTeX compilations.

The image is based on Debian slim with a minimal set of TeX Live packages installed. The image size is reasonably chunky, but it covers most use cases for compiling PDFs from LaTeX documents using `pdflatex`.

## Documentation

The following documentation is for the maintainers of this project. See the [Docker Hub repository](https://hub.docker.com/r/kieranpotts/latex) for instructions to use the Docker image. My [résumé](https://github.com/kieranpotts/resume) also demonstrates how to use the image.

### Requirements

- Docker
- Make
- Git

### Prerequisites

Make the `run/*` scripts executable:

```sh
chmod +x run/*
```

### Building

The following command builds an image from `./src/Dockerfile`:

```sh
make build
```

The image will be added to your locally running instance of Docker.

Verify the built image with this command:

```sh
docker images kieranpotts/latex:latest
```

### Publishing

Images are hosted on [Docker Hub](https://hub.docker.com/r/kieranpotts/latex).

To publish images to Docker Hub, you must have a Docker Hub account and a personal access token. Follow the steps below to create a new token:

1. Log in to [hub.docker.com](https://hub.docker.com).
2. Click on your username in the top-right → **Account Settings**.
3. Go to **Personal Access Tokens**.
4. Click **Generate New Token**.
5. Name it (eg. `CI image publishing`).
6. Set permission to **Read & Write**, or **Admin** if using teams.
7. Click **Generate**.
8. Copy the token. It is shown in plain text once only.

> **Important:** Treat the token like a password. Do not commit it to version control. If you do, regenerate it immediately via your Docker Hub account settings.

Set the below environment variables. Optionally, add these to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.) to persist them.

```sh
export DOCKER_USERNAME=kieranpotts
export DOCKER_TOKEN=<your-personal-access-token>
```

Tag the HEAD Git commit with a semantic version:

```
$ git tag -a v[major].[minor].[patch]
```

It is RECOMMENDED to include a short message that summarizes the changes in the release:

```
$ git tag -a v2.1.0 -m "Upgrade base image to latest LTS"
```

Push the new tag:

```
$ git push origin v2.1.0
```

Or push any new tags with new commits:

```
$ git push --follow-tags
```

Or you can push commits and tags separately:

```
$ git push
$ git push --tags
```

With the HEAD commit tagged, you can run `make publish` to publish the image to Docker Hub:

```sh
make publish
```

The `publish` script will:

- Authenticate to Docker Hub using your token.
- Apply a versioned tag, eg. `kieranpotts/latex:1.0.0`, based on the current Git tag.
- Push the image, with both the versioned and `latest` tags, to Docker Hub.
- Log out of Docker Hub.

The image will then be available to pull globally. You can choose to sync your local image with the latest one available from Docker Hub, or pin your image to a specific release:

```sh
docker pull kieranpotts/latex:latest
docker pull kieranpotts/latex:1.0.0
```

---

Copyright © 2025-present Kieran Potts, [MIT license](./LICENSE.txt)
