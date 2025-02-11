#!/usr/bin/env sh

set -e

if ! which curl > /dev/null; then
    if grep -q "alpine" /etc/os-release; then
        apk add --no-cache curl git
    else
        apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get install -y -q curl git ca-certificates
    fi
fi

get_version() {
    if [ -z "$VERSION" ] || [ "$VERSION" = "latest" ]; then
      url=$(curl "https://github.com/bats-core/bats-core/releases/latest" -s -L -I -o /dev/null -w '%{url_effective}')
      echo -n "${url##*v}"
    else
      echo -n "$VERSION"
    fi
}

VERSION="$(get_version)"

echo "Activating feature 'bats' version $VERSION"

git clone https://github.com/bats-core/bats-core.git --branch "v$(get_version)" /tmp/bats-core && \
  cd /tmp/bats-core && ./install.sh /usr/local && rm -rf /tmp/bats-core
