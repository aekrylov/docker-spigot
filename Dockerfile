FROM openjdk:8-jdk

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# MC_HOME         default directory for SPIGOT-server
# MC_VER          default minecraft version to compile
ENV MC_HOME=/minecraft \
    MC_VER=latest

# add extra files needed
COPY rootfs /

RUN apt-get update && \

    # upgrade OS
    apt-get -y dist-upgrade && \

    # install application
    apt-get install -y wget git && \

    # Make special user for minecraft to run in
    /usr/sbin/useradd -s /bin/bash -d /minecraft -m minecraft && \

    # remove apt cache from image
    apt-get clean all


# expose minecraft port
EXPOSE 25565

USER minecraft

ENTRYPOINT ["/bin/bash", "/start.sh"]