# Contributing

Contributions are welcome. For substantial changes, open an issue first to
discuss the proposed change.

## Changes

- Keep changes focused on building or documenting this container.
- Do not commit installers or other third-party binaries. Record the source
  and applicable license for any new third-party component.

## Validation

Build the image on a Windows Docker host:

```shell
docker build --pull --rm -t fretje/crystalreportsruntime:latest .
```

In your pull request, describe the change and include the result of the build
if you can run it.
