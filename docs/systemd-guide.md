# Systemd Guide

To ensure Baikal is up after reboots, I also included a [Systemd service template](https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/src/branch/master/baikal.service) which relies on the Docker Compose file to start all containers. Before you use it, make sure that the working directory matches your server setup.

```bash
sudo curl -o /etc/systemd/system/baikal.service https://git.justprojects.de/subDesTagesMitExtraKaese/baikal-docker/raw/branch/master/baikal.service
# Adjust the WorkingDirectory variable

sudo systemctl enable baikal.service
```

This automatically starts the service whenever your server (re)boots.
