FROM ubuntu:focal
RUN apt-get update
RUN apt-get full-upgrade --yes
RUN apt-get install --yes software-properties-common jq debian-archive-keyring distro-info
RUN add-apt-repository --yes ppa:oem-solutions-engineers/pc-enablement-tools
RUN apt-get --yes install --no-install-recommends oem-scripts openssh-client
