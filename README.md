This repository provides a development environment for Bref via single Docker image and convenience script.

Thanks to that image you can easily get started with Bref without having to install its tools: `serverless`, `aws`, `php`, `composer`…

## Usage

Run any command in the container using `./dev-env`:

```bash
./dev-env <command>

# For example:
./dev-env php -v
```

You can also clone this repo and make a symlink of `dev-env` script to somewhere in your `$PATH`.

## Explanations

Bref is NOT preinstalled in `bref/dev-env` image. For it to work you have to first install it via `./dev-env composer require bref/bref`. This will create not only typical `vendor` directory in your project but also `.composer` directory for Composer cache, which you can add to your `.gitignore` file.

The Serverless util uses `.serverless` directory also located in your project. You can ignore that as well.
