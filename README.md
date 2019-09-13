This repository provides a development environment for Bref via a Docker image.

Thanks to that image you can easily get started with Bref without having to install its tools: `serverless`, `aws`, `php`, `composer`…

## Usage

Run any command in the container:

```bash
docker run --rm -it bref/dev-env <command>

# For example:
docker run --rm -it bref/dev-env php -v
```
