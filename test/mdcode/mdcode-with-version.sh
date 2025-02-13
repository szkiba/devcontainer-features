#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'mdcode' feature with "version": "0.1.0" option.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "execute command" bash -c "mdcode --version | grep 'mdcode version 0.1.0'"

# Report results
reportResults
