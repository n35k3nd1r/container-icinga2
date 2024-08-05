# /bin/sh

podman build --rm -f "./build/Containerfile.Icinga2" -t icinga/icinga2/base:latest --force-rm