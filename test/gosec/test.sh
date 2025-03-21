#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'gosec' feature with no options.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
url=$(wget -q -O - --spider -S "https://github.com/securego/gosec/releases/latest" 2>&1 | grep Location)
latest="${url##*v}"
check "execute command" bash -c "gosec --version | grep 'Version: $latest'"

# Report results
reportResults
