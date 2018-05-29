GoContainerFramework
====================

A bootstrap framework for generating Go images

## How does it work?

When starting a new project, clone this repository, and then follow the steps below.

First, edit the `.env` file to include your own information:

Example:

```
APPNAME="goApp"
MAINTAINER="Chris Collins <collins.christopher@gmail.com>"
GOPATH_SRC_DIR="github.com/clcollins"
GOLANG_IMAGE="golang:1.8"
```

Write your go files and tests.  These files will be built and tested in the `Dockerfile-builder` image, and the generated binaries will be copied into a `./pkg` directory and inserted into the resulting `scratch` image.

Do all the building automatically by running the `build.sh` file.

If everything succeeds, there will be a resulting Docker image with your binary in it, which can be run using the CMD or ENTRYPOINT you used for the `APPNAME` variable in the .env file.

## Note:

The `Dockerfile-builder` and `Dockerfile` can be modified to suit your needs, but there are a few lines that will always be overwritten by the `build.sh` file, when run:

```
## In Dockerfile-builder:

# The FROM image will be replaced with a generated line
FROM

# The LABEL for maintainer will be replaced with a generated line
LABEL maintainer=

# The ENV for appname wil be replaced with a generated line
ENV appname=

# The ENV for appdir wil be replaced with a generated line
ENV appdir=

## In Dockerfile:

# The LABEL for maintainer will be replaced with a generated line
LABEL maintainer=

# The CMD will be replaced with a generated line
CMD
```
