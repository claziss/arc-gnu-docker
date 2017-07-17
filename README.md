ARC GNU Docker Container [![Build Status](https://travis-ci.org/claziss/arc-gnu-docker.svg?branch=master)](https://travis-ci.org/claziss/arc-gnu-docker)
=====

This container helps building the GNU toolchain for ARC processors using the latest releases form Synopsys git account.

Setup
-----
Build the container using the provided make file:
```bash
make build

```
How to use this image
-----
The most straightforward way to use this image is to use a gcc container as both the build and runtime environment. In your Dockerfile, writing something along the lines of the following will compile and run your project:

```bash
FROM claziss:arc-gcc
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN gcc -o myapp main.c
CMD ["./myapp"]

```
Then, build and run the Docker image:
```bash
$ docker build -t my-gcc-app .
$ docker run -it --rm --name my-running-app my-gcc-app

```
