#!/usr/bin/env sh

set -e

OWNER=bats-core
NAME=bats-core

if ! which wget > /dev/null; then
    if grep -vq "alpine" /etc/os-release; then
        apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get install -y -q wget ca-certificates
    fi
fi

if ! which git > /dev/null; then
    if grep -q "alpine" /etc/os-release; then
        apk add --no-cache git
    else
        DEBIAN_FRONTEND=noninteractive apt-get install -y -q git
    fi
fi

get_version() {
    if [ -z "$VERSION" ] || [ "$VERSION" = "latest" ]; then
      url=$(wget -q -O - --spider -S "https://github.com/${OWNER}/${NAME}/releases/latest" 2>&1 | grep Location)
      echo -n "${url##*v}"
    else
      echo -n "$VERSION"
    fi
}

VERSION="$(get_version)"

echo "Activating feature 'bats' version $VERSION"

git clone https://github.com/$OWNER/$NAME.git --branch "v$(get_version)" /tmp/$NAME && \
  cd /tmp/$NAME && ./install.sh /usr/local && rm -rf /tmp/$NAME
