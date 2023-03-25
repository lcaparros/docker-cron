# docker-<nameService>
Some amazing Docker images to work with <nameService> Out Of The Box

[![Docker Hub](https://img.shields.io/static/v1.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=lcaparros/<nameService>&message=Docker%20Hub&logo=docker)](https://hub.docker.com/r/lcaparros/<nameService>)
[![Docker Pulls](https://img.shields.io/docker/pulls/lcaparros/<nameService>.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=pulls&logo=docker)](https://hub.docker.com/r/lcaparros/<nameService>)
[![Docker Stars](https://img.shields.io/docker/stars/lcaparros/<nameService>.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=stars&logo=docker)](https://hub.docker.com/r/lcaparros/<nameService>)
[![GitHub Repository](https://img.shields.io/static/v1.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=lcaparros/docker-<nameService>&message=GitHub%20Repo&logo=github)](https://github.com/lcaparros/docker-<nameService>)
[![GitHub Stars](https://img.shields.io/github/stars/lcaparros/docker-<nameService>.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&logo=github)](https://github.com/lcaparros/docker-<nameService>)
[![GitHub Release](https://img.shields.io/github/release/lcaparros/docker-<nameService>.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&logo=github)](https://github.com/lcaparros/docker-<nameService>/releases)
[![GitHub](https://img.shields.io/static/v1.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=lcaparros&message=GitHub&logo=github)](https://github.com/lcaparros "view the source for all of our repositories.")

# Contribution

## Pull Requests

Create a new Pull Request with the necessary changes. After being reviewed and merged a new tag will be generated, creating a new Release and publishing the new version.

```shell
$ git tag -a v1.0.9 -m "This is my new amazing version"
$ git push origin v1.0.9
```

## How to push a new version of the image manually

```shell
$ docker build --build-arg VERSION=<version> --build-arg BUILD_DATE="$(date +%Y/%m/%dT%H:%M:%S)" -t <nameService> .
$ docker tag terraform lcaparros/<nameService>:<version>
$ docker push lcaparros/<nameService>:<version>
```

# Usage

It is necessary to share a volume to the current directory to make the necessary <nameService> files available for the Docker container (use the `/files` volume in the container). A good way to use this image could be to create a new alias in your bash_profile file:

```shell
alias <nameService>='docker run --rm -it -v $(pwd):/files lcaparros/<nameService>:<version>'
```

Now you could just type `<nameService>` in the CLI and it will work as the real <nameService> binary.