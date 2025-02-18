# Cache/Install NodeJS Dependencies

This GitHub Action caches NodeJS dependencies or installs them if the cache is not available.

## Inputs

### `caching`

**Optional**  
**Default**: `true`  
Whether to cache dependencies or not.

### `node-manager`

**Optional**  
**Default**: `npm`  
The node manager to use (`npm` or `yarn`).

### `lock-file`

**Optional**  
**Default**: `package-lock.json`  
The lock file to use.

## Outputs

### `used-cache`

Whether the cache was used or not.

## Example usage

```yaml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Cache/Install NodeJS Dependencies
        uses: LuisFuenTech/gha-cache-deps@v1.1.2
        with:
          caching: true
          node-manager: yarn
          lock-file: yarn.lock
```
