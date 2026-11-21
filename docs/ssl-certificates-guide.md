# SSL Certificates Guide

## Let's Encrypt + Traefik

[Traefik](https://traefik.io/) is a modern HTTP reverse proxy that supports Docker + [Let's Encrypt](https://letsencrypt.org) and manages its configuration automatically and dynamically.

An example for Docker Compose can be found at [examples/docker-compose.ssl.yaml](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/examples/docker-compose.ssl.yaml).

This is my recommended approach, as your other containers can easily be added and you don't have to actively manage your certificates, Traefik creates new ones & replaces them when needed. Furthermore, since the image is an [official Docker image](https://hub.docker.com/_/traefik/), you won't have to worry as much about getting updates from a third party - aka me.

I included an example Docker Compose file [examples/docker-compose.ssl.yaml](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/examples/docker-compose.ssl.yaml) as a template.

For more details on the Traefik configuration, see [Traefik's Docker](https://doc.traefik.io/traefik/providers/docker/) and [Traefik's Let's Encrypt](https://doc.traefik.io/traefik/https/acme/) docs.

## Static Certificates

If you want to use your own certificates, put this container behind an HTTPS proxy, e.g. [Traefik](https://doc.traefik.io/traefik/https/tls/) or [nginx](https://hub.docker.com/_/nginx/).

The image itself only listens on port 80 and serves plain HTTP.

This way your other containers can easily be added and since the images are either official Docker images, e.g. [Traefik](https://hub.docker.com/_/traefik/) and [nginx](https://hub.docker.com/_/nginx/), or directly come from the maintainers, you won't have to worry as much about getting updates from a third party - aka me. Security is important for all our internet facing workloads and using the official images makes keeping us safer just that much easier.
