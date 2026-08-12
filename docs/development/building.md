# Building

## Requirements

- Docker
- Make
- Git

## Prerequisites

Make the `run/*` scripts executable:

```sh
chmod +x run/*
```

## Building

The following command builds an image from `./src/Dockerfile`:

```sh
make build
```

The image will be added to your locally running instance of Docker.

Verify the built image with this command:

```sh
docker images kieranpotts/latex:latest
```
