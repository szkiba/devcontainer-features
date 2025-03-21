#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'all' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
# 
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

if grep -q "debian" /etc/os-release; then
   GOLANG_SUPPORTED=true
fi

echo -e "The result of the 'mdcode --version' command will be:\n"
mdcode --version
echo -e "The result of the 'cdo --version' command will be:\n"
cdo --version
echo -e "The result of the 'bats --version' command will be:\n"
bats --version

if [ "$GOLANG_SUPPORTED" == true ]; then
  echo -e "The result of the 'gosec --version' command will be:\n"
  gosec --version
  echo -e "The result of the 'govulncheck -version' command will be:\n"
  govulncheck -version
fi

echo -e "\n"

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "check mdcode version" bash -c "mdcode --version | grep 'mdcode version'"
check "check cdo version" bash -c "cdo --version | grep 'cdo version'"
check "check bats version" bash -c "bats --version | grep 'Bats'"

if [ "$GOLANG_SUPPORTED" == true ]; then
  check "check gosec version" bash -c "gosec --version | grep 'Version:'"
  check "check govulncheck version" bash -c "govulncheck --version | grep 'Scanner: govulncheck@'"
fi

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
