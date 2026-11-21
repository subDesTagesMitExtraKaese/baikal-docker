# Baikal

[![Build](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/actions/workflows/docker-build.yml/badge.svg)](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/actions/workflows/docker-build.yml) ![Docker Architectures](https://img.shields.io/badge/arch-amd64%20%7C%20arm32v7%20%7C%20arm64v8%20%7C%20i386-informational)

This dockerfile provides a ready-to-go [Baikal server](http://sabre.io/baikal/).

For more details, see [ckulka/baikal-docker (GitHub)](https://github.com/ckulka/baikal-docker).

## Supported tags

This fork publishes a single nginx-based image with PHP 8.2 to the Forgejo container registry on every push to `master`:

```bash
git.justprojects.de/subdestagesmitextrakaese/baikal-docker:<tag>
```

- `latest`, `nginx`, `nginx-php8.2` are re-builds of the current Dockerfile to include the latest base images with the most recent updates
- `0.10.1`, `0.10.1-nginx`, `0.10.1-nginx-php8.2` are builds of Baikal 0.10.1

Tags follow the same version naming scheme as [Baikal](http://sabre.io/baikal/) themselves.

All tags support multiple architectures, e.g. `amd64`, `arm32v7`, `arm64v8` and `i386`.

## Quick reference

- **Where to file issues**:
  [https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/issues](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/issues)
- **Supported architectures** ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64)):
  `amd64`, `arm32v7`, `arm64v8`, `i386`
- **Image updates**:
  [PRs for subDesTagesMitExtraKaese/baikal-docker](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/pulls)
- **Source of this description**:
  [https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker)

## What is Baikal?

From [sabre.io/baikal](http://sabre.io/baikal/):

> Baikal is a Cal and CardDAV server, based on sabre/dav, that includes an administrative interface for easy management.
>
> For more information, read the main website at baikal-server.com.
>
> Baikal is developed by Net Gusto and fruux.

## How to use this image

The following command will start Baikal:

```bash
docker run --rm -it -p 80:80 git.justprojects.de/subdestagesmitextrakaese/baikal-docker:latest
```

Alternatively, use the provided [examples/docker-compose.yaml](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/examples/docker-compose.yaml) from the Git repository:

```bash
docker compose up
```

You can now open [http://localhost](http://localhost) or [http://host-ip](http://host-ip) in your browser and use Baikal.

### Persistent Data

The image exposes the `/var/www/baikal/Specific` and `/var/www/baikal/config` folders, which contain the persistent data. These folders should be part of a regular backup.

If you want to use local folders instead of Docker volumes, see [examples/docker-compose.localvolumes.yaml](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/examples/docker-compose.localvolumes.yaml) to avoid file permission issues.

When the container starts, the startup script `/docker-entrypoint.d/40-fix-baikal-file-permissions.sh` ([nginx](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/files/docker-entrypoint.d/nginx/40-fix-baikal-file-permissions.sh)) ensures that the file permissions are correct. You can disable this behaviour by setting the environment variable `BAIKAL_SKIP_CHOWN` to any value, e.g. `FALSE`.

### Further Guides

You can find more installation and configuration guides here:

- [Email Guide](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/docs/email-guide.md)
- [Home Assistant Fix](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/docs/home-assistant-fix.md)
- [SSL Certificate Guide](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/docs/ssl-certificates-guide.md)
- [systemd Guide](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/docs/systemd-guide.md)
- [Unraid Installation Guide](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/docs/unraid-installation-guide.md)

## Image

The image is based on [nginx](https://www.nginx.com/) and uses the [official nginx image](https://hub.docker.com/_/nginx/). PHP 8.2 runs as PHP-FPM behind nginx.

It listens on port 80 and serves plain HTTP. To use HTTPS, terminate TLS in a reverse proxy such as Traefik; see the [SSL Certificate Guide](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/docs/ssl-certificates-guide.md).
