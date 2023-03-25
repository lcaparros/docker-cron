# docker-cron
Some amazing Docker images to work with cron Out Of The Box

[![Docker Hub](https://img.shields.io/static/v1.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=lcaparros/cron&message=Docker%20Hub&logo=docker)](https://hub.docker.com/r/lcaparros/cron)
[![Docker Pulls](https://img.shields.io/docker/pulls/lcaparros/cron.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=pulls&logo=docker)](https://hub.docker.com/r/lcaparros/cron)
[![GitHub Repository](https://img.shields.io/static/v1.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=lcaparros/docker-cron&message=GitHub%20Repo&logo=github)](https://github.com/lcaparros/docker-cron)
[![GitHub](https://img.shields.io/static/v1.svg?color=4edafc&labelColor=555555&logoColor=ffffff&style=flat&label=lcaparros&message=GitHub&logo=github)](https://github.com/lcaparros "view the source for all of our repositories.")

# Usage

This docker image will be the foundation to run cronjobs from every dockerized engine. Just pull this image and add the script to be executed by cron in the **files** directory. Inlcude also a file named **crontab.txt** with the crontab to be initialize. This repo stores an example of __files__ directory with some scripts and crontab files.

## Logging

By default, Cron jobs output is not send automatically to stdout or any system logger. As running in docker, it is possible to send scripts output to Docker log files adding `/proc/1/fd/1 2>&1` to the lines wanted to be logged in the crontab file. For example:

```
*/1 * * * * bash /files/test.sh > /proc/1/fd/1 2>&1
*/1 * * * * bash /files/test2.sh > /proc/1/fd/1 2>&1
```

If there are more process running in the used image use `> /proc/$(cat /var/run/crond.pid)/fd/1 2>&1` instead.

# Contribution

## Pull Requests

Create a new Pull Request with the necessary changes. After being reviewed and merged a new tag will be generated, creating a new Release and publishing the new version.

```shell
$ git tag -a v1.0.9 -m "This is my new amazing version"
$ git push origin v1.0.9
```

## How to push a new version of the image manually

```shell
$ docker build --build-arg VERSION=<version> --build-arg BUILD_DATE="$(date +%Y/%m/%dT%H:%M:%S)" -t lcaparros/cron:<version> .
$ docker push lcaparros/cron:<version>
```