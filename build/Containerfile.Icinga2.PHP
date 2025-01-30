###########################################################################
#                                                                         #
# Containerfile for Icinga DB Web based on RHEL8 (UBI8) with micro Images #
# Maintainer: Alexander Plate (alexander.plate@axalon.ch)                 #
#                                                                         #
###########################################################################
FROM scratch
ARG MAINRAINER
ARG VENDOR
ARG VERSION
ARG RELEASE

LABEL name="Icinga PHP" \
    maintainer=$MAINRAINER \
    vendor=$VENDOR \
    version=$VERSION \
    release=$RELEASE \
    summary="Icinga PHP" \
    description="Icinga PHP"

COPY --from=icinga/base:latest /mnt/rootfs/php /
COPY ./icinga_php/php-fpm.conf /etc/php-fpm.conf
COPY ./icinga_php/icingaweb2/ /etc/icingaweb2/

RUN mkdir /run/php-fpm; \
    chown -R apache:apache \
    /run/php-fpm \
    /etc/php-fpm.conf \
    /etc/icingaweb2/; \
    pecl install imagick; \
    echo extension=imagick.so >> /etc/php.ini;

USER apache

CMD php-fpm