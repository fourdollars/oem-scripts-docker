# syntax=docker/dockerfile:1.4
FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN <<EOF
# Install oem-scripts from ppa:oem-solutions-engineers/pc-enablement-tools
apt-get -q -q update
apt-get full-upgrade --yes
apt-get install --yes software-properties-common jq debian-archive-keyring distro-info openssh-client curl python3-yaml bind9-dnsutils jenkins-job-builder
add-apt-repository --yes ppa:oem-solutions-engineers/pc-enablement-tools
apt-get --yes install --no-install-recommends oem-scripts colordiff
EOF
RUN <<EOF
# Install yq from https://github.com/mikefarah/yq/
curl -sSL https://raw.githubusercontent.com/fourdollars/scripts/master/golang.sh | bash -
cat > /root/.bash_aliases <<ENDLINE
# https://golang.org/
if [ -d "\$HOME/.local/share/go/bin" ]; then
    GOPATH="\$HOME/.local/share/go"
    PATH="\$PATH:\$GOPATH/bin"
    export GOPATH
    export PATH
fi
ENDLINE
. /root/.bash_aliases
rm /root/.bash_aliases
go install github.com/mikefarah/yq/v4@latest
mkdir -p /usr/local/bin/
cp -v /root/.local/share/go/bin/yq /usr/local/bin/
rm -fr /root/.local/share/go /root/.cache/go-build
EOF
