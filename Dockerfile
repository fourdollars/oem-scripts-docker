# syntax=docker/dockerfile:1.3-labs
FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN <<EOF
apt-get update
apt-get full-upgrade --yes
apt-get install --yes software-properties-common jq debian-archive-keyring distro-info openssh-client curl python3-yaml
add-apt-repository --yes ppa:oem-solutions-engineers/pc-enablement-tools
apt-get --yes install --no-install-recommends oem-scripts
EOF
