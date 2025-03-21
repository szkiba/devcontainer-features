#!/usr/bin/env sh

set -e

OWNER=golang
NAME=vuln

if ! which wget > /dev/null; then
    if grep -q "debian" /etc/os-release; then
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

echo "Activating feature 'govulncheck' version $VERSION"

get_go_platform() {
    platform=''
    machine=$(uname -m)

    case "$(uname -s | tr '[:upper:]' '[:lower:]')" in
    "linux")
        case "$machine" in
        "arm64"* | "aarch64"* ) platform='linux-arm64' ;;
        *"64") platform='linux-amd64' ;;
        esac
        ;;
    "darwin")
        case "$machine" in
        "arm64"* | "aarch64"* ) platform='darwin-arm64' ;;
        *"64") platform='darwin-amd64' ;;
        esac
        ;;
    esac

    echo -n "$platform"
}

get_go_version() {
    wget -qO - https://go.dev/VERSION?m=text| head -1
}

GO_VERSION="$(get_go_version)"
PLATFORM="$(get_go_platform)"

export TMPDIR="$(mktemp -d)"

wget -qO - https://dl.google.com/go/${GO_VERSION}.${PLATFORM}.tar.gz | tar x -zf - -C $TMPDIR

export GOPATH=$TMPDIR/go

GOBIN=/usr/local/bin ${GOPATH}/bin/go install -ldflags="-s -w" golang.org/x/vuln/cmd/govulncheck@v$VERSION

rm -rf $TMPDIR
