#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'bats' feature with "version": "1.11.1" option.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "execute command" bash -c "bats --version | grep 'Bats 1.11.1'"

# Report results
reportResults
