
# Bash Automated Testing System (bats)

Bats is a TAP-compliant testing framework for Bash. It provides a simple way to verify that the UNIX programs you write behave as expected.

## Example Usage

```json
"features": {
    "ghcr.io/szkiba/devcontainer-features/bats:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install | string | latest |

## Documentation

Visit the [GitHub repository](https://github.com/bats-core/bats-core) for documentation.

A Bats test file is a Bash script with special syntax for defining test cases. Under the hood, each test case is just a function with a description.

```bash
#!/usr/bin/env bats

@test "addition using bc" {
  result="$(echo 2+2 | bc)"
  [ "$result" -eq 4 ]
}

@test "addition using dc" {
  result="$(echo 2 2+p | dc)"
  [ "$result" -eq 4 ]
}
```

Test cases consist of standard shell commands. Bats makes use of Bash's `errexit` (`set -e`) option when running test cases. If every command in the test case exits with a `0` status code (success), the test passes. In this way, each line is an assertion of truth.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/szkiba/devcontainer-features/blob/main/src/bats/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
