#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'gosec' feature with "version": "2.22.2" option.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "execute command" bash -c "gosec --version | grep 'Version: 2.22.2'"

# Report results
reportResults
