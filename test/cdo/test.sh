#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'cdo' feature with no options.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
url=$(curl "https://github.com/szkiba/cdo/releases/latest" -s -L -I -o /dev/null -w '%{url_effective}')
latest="${url##*v}"
check "execute command" bash -c "cdo --version | grep 'cdo version $latest'"

# Report results
reportResults
