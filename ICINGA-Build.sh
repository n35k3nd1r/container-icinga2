# /bin/sh
maintainer="alexander.plate@axalon.ch"
vendor="Axalon GmbH"
version="1"
release="1"

podman build --rm -f "./build/Containerfile.Base"           -t icinga/base:latest --force-rm
podman build --rm -f "./build/Containerfile.Icinga2"        -t icinga/icinga-2:latest   -t icinga/icinga-2:${version}.${release}    --build-arg MAINRAINER="$maintainer" --build-arg VENDOR="$vendor" --build-arg VERSION="$version" --build-arg RELEASE="$release" --force-rm
podman build --rm -f "./build/Containerfile.Icinga2.DB"     -t icinga/icinga/db:latest  -t icinga/icinga/db:${version}.${release}   --build-arg MAINRAINER="$maintainer" --build-arg VENDOR="$vendor" --build-arg VERSION="$version" --build-arg RELEASE="$release" --force-rm
podman build --rm -f "./build/Containerfile.Icinga2.PHP"    -t icinga/icinga/php:latest -t icinga/icinga/php:${version}.${release}  --build-arg MAINRAINER="$maintainer" --build-arg VENDOR="$vendor" --build-arg VERSION="$version" --build-arg RELEASE="$release" --force-rm
podman image prune -f