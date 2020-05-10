This repository provides a development environment for Bref via single Docker image and convenience script.

Thanks to that image you can easily get started with Bref without having to install its tools: `serverless`, `aws`, `php`, `composer`…

## Usage

Run any command in the container using `./dev-env.sh`:

```bash
./dev-env <command>

# For example:
./dev-env php -v
```

or via `docker run` directly:

```bash
docker run --rm --interactive --tty \
    --user "$(id -u)":"$(id -g)" \
    --group-add "${DOCKER_GROUP_ID}" \
    --env HOST_AWS_CONF_DIR="${AWS_CONF_DIR}" \
    --volume "${DOCKER_SOCK_PATH}:/var/run/docker.sock" \
    --volume "${AWS_CONF_DIR}:/home/app/.aws" \
    --volume "${PWD}/:/app" \
    "bref/dev-env" <command>
```

You can also clone this repo and make a symlink of `dev-env` script to somewhere in your `$PATH`.

## Explanations

Path to your `docker.sock` file is required for `serverless invoke local --docker -f myFunction` to work.

The `HOST_AWS_CONF_DIR` ENV variable is needed for running `bref/dashboard`. It's because we can't simply use volume mappings from inside of `bref/dev-env` container since in case of Docker in Docker mappings are from host instead.

Bref is NOT preinstalled in `bref/dev-env` image. For it to work you have to first install it via `./dev-env composer require bref/bref`. This will create not only typical `vendor` directory in your project but also `.composer` directory for Composer cache, which you can add to your `.gitignore` file.

The Serverless util uses `.serverless` directory also located in your project. You can ignore that as well.
