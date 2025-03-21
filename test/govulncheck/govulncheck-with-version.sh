#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'govulncheck' feature with "version": "1.1.4" option.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "execute command" bash -c "govulncheck -version | grep 'Scanner: govulncheck@v1.1.4'"

# Report results
reportResults
