
# Markdown code block authoring tool (mdcode)

The `mdcode` command-line tool allows code blocks embedded in a markdown document to be developed in the usual way. During the development of the code blocks, the usual tools and methods can be used. This makes the embedded codes testable, which is especially important for example codes. There is no worse developer experience than a faulty sample code.

## Example Usage

```json
"features": {
    "ghcr.io/szkiba/devcontainer-features/mdcode:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install | string | latest |

## Documentation

Visit the [GitHub repository](https://github.com/szkiba/mdcode) for documentation.

### Features

- include source files as code blocks in the markdown document
- update the code blocks in the markdown document
- save markdown code blocks to source files
- supports source file fragments using `#region` comments
- supports invisible (not rendered) code blocks
- allows you to add metadata to code blocks
- programming language agnostic
- dump code blocks as tar archive


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/szkiba/devcontainer-features/blob/main/src/mdcode/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
