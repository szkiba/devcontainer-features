
# Markdown-based task runner for contributors (cdo)

The `cdo` command line tool allows contributors to perform routine tasks conveniently. The markdown code blocks defining the tasks can be specified in the `CONTRIBUTING.md` or `README.md` files by default. Tasks are executed using a portable, embedded `bash`-like shell.

## Example Usage

```json
"features": {
    "ghcr.io/szkiba/devcontainer-features/cdo:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install | string | latest |

## Documentation

Visit the [GitHub repository](https://github.com/szkiba/mdcode) for documentation.

### Features

- the contributing documentation becomes task definitions
- the existing `CONTRIBUTING.md`/`README.md` is used for task definition
- human-readable alternative to make/Makefile (for simple tasks)
- dependencies can be specified for tasks
- portable, bash-like embedded shell
- [BusyBox support](#busybox) for non-built-in commands for portability
- the tasks can be executed even without the `cdo`
- Makefile can be generated from the task definitions


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/szkiba/devcontainer-features/blob/main/src/cdo/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
